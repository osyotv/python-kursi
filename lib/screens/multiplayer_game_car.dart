import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/games_screen.dart';
import 'package:python_darslari/services/firebase_service.dart';
import 'package:python_darslari/theme/theme.dart';

class MultiplayerGameCarScreen extends StatefulWidget {
  final String roomId;
  final String myName;
  final String mySessionId;

  const MultiplayerGameCarScreen({
    super.key,
    required this.roomId,
    required this.myName,
    required this.mySessionId,
  });

  @override
  State<MultiplayerGameCarScreen> createState() => _MultiplayerGameCarScreenState();
}

class _MultiplayerGameCarScreenState extends State<MultiplayerGameCarScreen> with SingleTickerProviderStateMixin {
  // Game Variables
  late List<GameQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _hearts = 3;
  bool _gameOver = false;
  bool _gameWon = false;

  // Car Settings
  int _carLane = 1; // 0 = Left, 1 = Middle, 2 = Right
  double _carAlignOffset = 0.0;
  String _selectedCar = 'jiguli';

  // Obstacle/Gate Settings
  double _wallY = -0.2;
  late List<String> _gateOptions;
  late int _correctGate;

  Timer? _gameTimer;
  Timer? _multiplayerSyncTimer;
  double _speed = 0.0035;
  double _roadOffset = 0.0;

  // Crash animation
  late AnimationController _crashAnimController;
  late Animation<double> _shakeAnim;

  // Firebase Sync state
  final FirebaseService _firebase = FirebaseService();
  List<Map<String, dynamic>> _opponents = [];
  double _glowPulse = 0.0;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _crashAnimController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnim = Tween<double>(begin: 0.0, end: 15.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_crashAnimController);

    _initGame();
  }

  Future<void> _initGame() async {
    if (!mounted) return;

    final random = Random();
    final allQuestions = List<GameQuestion>.from(GamesScreen.questionBank);
    allQuestions.shuffle(random);
    _questions = allQuestions.take(10).toList();

    _currentQuestionIndex = 0;
    _score = 0;
    _hearts = 3;
    _gameOver = false;
    _gameWon = false;
    _carLane = 1;
    _carAlignOffset = 0.0;
    _wallY = -0.2;
    _roadOffset = 0.0;

    final state = AppStateProvider.of(context);
    _selectedCar = state.activeCarKey;

    _setupQuestion();
    _startGame();
    _startMultiplayerSync();
  }

  void _setupQuestion() {
    if (_currentQuestionIndex >= _questions.length) {
      _finishGame();
      return;
    }

    final question = _questions[_currentQuestionIndex];
    final random = Random();

    final choices = List<String>.from(question.choices);
    choices.shuffle(random);

    _gateOptions = choices;
    _correctGate = choices.indexOf(question.answer);
    _wallY = -0.2;
  }

  void _startGame() {
    _speed = 0.0038; // Default medium speed for multiplayer

    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameOver || _gameWon) {
        timer.cancel();
        return;
      }

      setState(() {
        _wallY += _speed;
        _roadOffset += _speed * 60;
        _time += 0.05;
        _glowPulse = sin(_time) * 4.0;
        
        double targetAlignOffset = (_carLane - 1) * 0.75;
        _carAlignOffset += (targetAlignOffset - _carAlignOffset) * 0.25;
      });

      if (_wallY >= 0.72 && _wallY <= 0.80) {
        _checkCollision();
      }

      if (_wallY >= 0.95) {
        _triggerCrash();
      }
    });
  }

  void _checkCollision() {
    if (_carLane == _correctGate) {
      _score++;
      _currentQuestionIndex++;
      _speed += 0.0002;
      _setupQuestion();
    } else {
      _triggerCrash();
    }
  }

  void _triggerCrash() {
    _crashAnimController.forward(from: 0.0);
    setState(() {
      _hearts--;
      if (_hearts <= 0) {
        _gameOver = true;
        _gameTimer?.cancel();
        _writeSelfState(finished: true);
      } else {
        _currentQuestionIndex++;
        _setupQuestion();
      }
    });
  }

  void _finishGame() {
    _gameTimer?.cancel();
    setState(() {
      if (_score >= 7) {
        _gameWon = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            AppStateProvider.of(context, listen: false).addXP(30);
          }
        });
      } else {
        _gameOver = true;
      }
    });
    _writeSelfState(finished: true);
  }

  // 🔥 Firebase Real-Time Multiplayer Sync
  StreamSubscription<DocumentSnapshot>? _roomSubscription;

  void _startMultiplayerSync() {
    // 🔥 Real-time: Firebase Firestore'dan raqiblar holatini tinglash
    _roomSubscription = _firebase.roomStream(widget.roomId).listen((snapshot) {
      if (!mounted) return;

      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        final Map<String, dynamic> playersMap = Map<String, dynamic>.from(data['players'] ?? {});
        
        final List<Map<String, dynamic>> opponents = [];
        playersMap.forEach((uid, val) {
          if (uid != _firebase.uid) {
            final opponent = Map<String, dynamic>.from(val as Map);
            opponent['uid'] = uid;
            opponents.add(opponent);
          }
        });

        setState(() {
          _opponents = opponents;
        });
      }
    });

    // O'z holatimni har 150ms da Firebase'ga yuborish
    _multiplayerSyncTimer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _pushMyState();
      _simulateBots();
    });
  }

  /// O'z holatimni Firebase'ga yuborish
  Future<void> _pushMyState() async {
    if (!_firebase.isLoggedIn) return;

    final String activeCode = _currentQuestionIndex < _questions.length
        ? _questions[_currentQuestionIndex].code
        : 'FINISH';

    _firebase.updatePlayerFields(widget.roomId, {
      'position': _score.toDouble(),
      'score': _score,
      'lane': _carLane,
      'code': activeCode,
      'finished': _gameOver || _gameWon,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    });
  }

  /// Bot harakatlarini simulyatsiya qilish (faqat host)
  Future<void> _simulateBots() async {
    final isHost = await _firebase.isHost(widget.roomId);
    if (!isHost) return;

    final random = Random();
    for (final opp in _opponents) {
      final String oppUid = opp['uid'] ?? '';
      if (!oppUid.startsWith('bot_')) continue;
      if (opp['finished'] == true) continue;

      Map<String, dynamic> updates = {};

      // 8% imkoniyat bilan chiziqni o'zgartirish
      if (random.nextDouble() < 0.08) {
        updates['lane'] = random.nextInt(3);
      }

      // 3.5% imkoniyat bilan to'g'ri javob berish
      if (random.nextDouble() < 0.035) {
        int botScore = (opp['score'] ?? 0) as int;
        botScore++;
        updates['score'] = botScore;
        updates['position'] = botScore.toDouble();

        final botQuestions = GamesScreen.questionBank;
        updates['code'] = botQuestions[random.nextInt(botQuestions.length)].code;

        if (botScore >= 10) {
          updates['finished'] = true;
          updates['code'] = 'FINISH';
        }
      }

      if (updates.isNotEmpty) {
        updates['lastSeen'] = DateTime.now().millisecondsSinceEpoch;
        _firebase.updateBotState(widget.roomId, oppUid, updates);
      }
    }
  }

  Future<void> _writeSelfState({bool finished = false}) async {
    if (!_firebase.isLoggedIn) return;
    _firebase.updatePlayerFields(widget.roomId, {
      'finished': finished,
      'score': _score,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<void> _cleanRoomExit() async {
    _multiplayerSyncTimer?.cancel();
    _roomSubscription?.cancel();
    _gameTimer?.cancel();
    
    // Firebase'dan o'zimni o'chirish
    await _firebase.leaveRoom(widget.roomId);
  }

  @override
  void dispose() {
    _multiplayerSyncTimer?.cancel();
    _roomSubscription?.cancel();
    _gameTimer?.cancel();
    _crashAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _currentQuestionIndex < _questions.length
        ? _questions[_currentQuestionIndex]
        : _questions.last;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.spaceBlack, Color(0xFF0F0B24)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Status Panel
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.exit_to_app_rounded, color: AppTheme.errorRed),
                      onPressed: () {
                        _cleanRoomExit();
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Xona: ${widget.roomId} | Hisob: $_score/10",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.glassSurface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.glassBorder),
                      ),
                      child: Row(
                        children: List.generate(3, (index) {
                          return Icon(
                            Icons.favorite_rounded,
                            color: index < _hearts ? AppTheme.errorRed : AppTheme.textMuted,
                            size: 18,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Game Body
              Expanded(
                child: _gameOver || _gameWon
                    ? _buildResultScreen()
                    : _buildPlayfield(currentQuestion),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayfield(GameQuestion question) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final double laneWidth = width / 3;
        final double horizonY = height * 0.18;
        final double horizonW = width * 0.16;

        return Stack(
          children: [
            // 1. 3D Perspective Road & Cyber Landscape custom paint
            Positioned.fill(
              child: CustomPaint(
                painter: Road3DPainter(offset: _roadOffset),
              ),
            ),

            // 2. Render Opponents (3D Perspective Projection over the highway!)
            ..._opponents.map((opp) {
              final int oppScore = (opp['score'] ?? 0) is int ? opp['score'] ?? 0 : int.tryParse(opp['score'].toString()) ?? 0;
              final int oppLane = (opp['lane'] ?? 1) is int ? opp['lane'] ?? 1 : int.tryParse(opp['lane'].toString()) ?? 1;
              final String oppCar = opp['car']?.toString() ?? 'jiguli';
              final String oppName = opp['name']?.toString() ?? 'Bot';
              final String oppCode = opp['code'] ?? '';

              // Calculate Y position based on score difference
              final int scoreDiff = oppScore - _score;
              
              // Map score difference to a screen height progress factor (0.18 = Horizon, 0.70 = Player position)
              double relativeProgress = 0.68 + (scoreDiff * 0.07);
              relativeProgress = relativeProgress.clamp(0.22, 1.1);

              // Don't render if behind player camera viewport
              if (relativeProgress > 0.98 || relativeProgress < 0.20) {
                return const SizedBox.shrink();
              }

              final double oppY = relativeProgress * height;
              final double progress = (oppY - horizonY) / (height - horizonY);
              
              // Perspective width of the road at this Y
              final double roadW = horizonW + (width * 1.25 - horizonW) * progress;
              final double laneW = roadW / 3;
              final double laneX = (width / 2 - roadW / 2) + oppLane * laneW + laneW / 2;

              // Size scaling
              final double size = 32 + progress * 62;
              final double tagScale = 0.65 + progress * 0.35;

              return Positioned(
                left: laneX - size / 2,
                top: oppY - size - 15,
                child: SizedBox(
                  width: size,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Tag showing Opponent Nickname + active code
                      Transform.scale(
                        scale: tagScale,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.neonPurple, width: 0.5),
                          ),
                          child: Text(
                            "$oppName\n[$oppCode]",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Car image sprite
                      Image.asset(
                        'assets/images/$oppCar.png',
                        height: size,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.directions_car_filled_rounded, color: AppTheme.neonPurple, size: size),
                      ),
                    ],
                  ),
                ),
              );
            }),

            // 3. Approaching Obstacle Walls / Gate Options
            Positioned(
              top: _wallY * height,
              left: 0,
              right: 0,
              child: Row(
                children: List.generate(3, (index) {
                  final text = _gateOptions[index];
                  final isGateCorrect = _correctGate == index;
                  final isCollision = _wallY >= 0.72 && _wallY <= 0.80 && _carLane == index;

                  // Perspective size scaling
                  final double scaleFactor = 0.45 + (_wallY.clamp(0.0, 1.0) * 0.55);
                  final double opacity = (_wallY.clamp(0.0, 0.4) / 0.4);

                  return Container(
                    width: laneWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scaleFactor,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isCollision 
                                ? (isGateCorrect ? AppTheme.neonGreen.withOpacity(0.3) : AppTheme.errorRed.withOpacity(0.3))
                                : AppTheme.spaceBlack.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isCollision
                                  ? (isGateCorrect ? AppTheme.neonGreen : AppTheme.errorRed)
                                  : AppTheme.neonAmber.withOpacity(0.55),
                              width: 2.2,
                            ),
                          ),
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // 4. Player Sports Car (Smooth transitions & Glow effects)
            Positioned(
              bottom: height * 0.10,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _crashAnimController,
                builder: (context, child) {
                  double shakeX = 0;
                  if (_crashAnimController.isAnimating) {
                    shakeX = sin(_crashAnimController.value * pi * 10) * _shakeAnim.value;
                  }
                  return Transform.translate(
                    offset: Offset(shakeX, 0),
                    child: child,
                  );
                },
                child: Center(
                  child: SizedBox(
                    width: width,
                    height: 170,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          left: (width / 2 - laneWidth / 2) + _carAlignOffset * (laneWidth * 0.8),
                          child: Container(
                            width: laneWidth,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Keyword Code target
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppTheme.spaceBlack,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _getCarColor(_selectedCar),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: _getCarColor(_selectedCar).withOpacity(0.25),
                                        blurRadius: 8,
                                      )
                                    ],
                                  ),
                                  child: Text(
                                    question.code,
                                    style: TextStyle(
                                      fontFamily: 'monospace',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: _getCarColor(_selectedCar),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Underglow glowing shadow
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _getCarColor(_selectedCar).withOpacity(0.65),
                                            blurRadius: 18 + _glowPulse,
                                            spreadRadius: 4 + _glowPulse / 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Custom car sprite
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Transform.rotate(
                                        angle: -(_carAlignOffset - (_carLane - 1) * 0.75) * 0.2,
                                        child: Image.asset(
                                          'assets/images/$_selectedCar.png',
                                          height: 96,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stackTrace) =>
                                              Icon(Icons.directions_car_filled_rounded, color: _getCarColor(_selectedCar), size: 54),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 5. Tap Detectors for Lane movement
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _carLane = index;
                      });
                    },
                    child: const SizedBox.expand(),
                  ),
                );
              }),
            ),

            // 6. Help hint overlay
            const Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Ekranning chap / o'rtacha / o'ng qismiga bosing",
                  style: TextStyle(fontSize: 11, color: AppTheme.textMuted, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.glassSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _gameWon ? AppTheme.neonGreen.withOpacity(0.3) : AppTheme.errorRed.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _gameWon ? Icons.emoji_events_rounded : Icons.heart_broken_rounded,
              color: _gameWon ? AppTheme.neonGreen : AppTheme.errorRed,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              _gameWon ? "G'alaba!" : "O'yin Tugadi",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: _gameWon ? AppTheme.neonGreen : AppTheme.errorRed,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _gameWon
                  ? "Ajoyib haydash mahorati! Siz ko'p o'yinchi poygasida yutdingiz va 70% dan ko'p ball to'pladingiz.\n\nHisob: $_score/10 to'g'ri javob\n+30 XP hisobingizga qo'shildi!"
                  : "Mashinangiz halokatga uchradi yoki natijangiz 70% dan kam bo'ldi.\n\nHisob: $_score/10 to'g'ri javob",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: AppTheme.glassBorder),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _cleanRoomExit();
                    Navigator.pop(context);
                  },
                  child: const Text("Garajga Chiqish"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 3D Perspective Road & Landscape Painter
class Road3DPainter extends CustomPainter {
  final double offset;
  Road3DPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final double horizonY = h * 0.18;
    final double horizonW = w * 0.16;

    // 1. Cyber Sunset Gradient Sky
    final Rect skyRect = Rect.fromLTWH(0, 0, w, horizonY);
    final Paint skyPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF03010E),
          Color(0xFF09041A),
          Color(0xFF1E0234),
          Color(0xFF3B0243),
          Color(0xFF0C0116),
        ],
      ).createShader(skyRect);
    canvas.drawRect(skyRect, skyPaint);

    // 2. Pulsing sun
    final Paint sunPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFF007F).withOpacity(0.95),
          const Color(0xFFFF7B00).withOpacity(0.55),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(w * 0.5, horizonY), radius: 45));
    canvas.drawCircle(Offset(w * 0.5, horizonY), 35, sunPaint);

    // 3. Silhouette Mountains
    final Path mountainsPath = Path();
    mountainsPath.moveTo(0, horizonY);
    mountainsPath.lineTo(w * 0.12, horizonY - 20);
    mountainsPath.lineTo(w * 0.28, horizonY - 10);
    mountainsPath.lineTo(w * 0.46, horizonY - 38);
    mountainsPath.lineTo(w * 0.54, horizonY - 38);
    mountainsPath.lineTo(w * 0.68, horizonY - 12);
    mountainsPath.lineTo(w * 0.82, horizonY - 28);
    mountainsPath.lineTo(w, horizonY);
    mountainsPath.close();
    canvas.drawPath(mountainsPath, Paint()..color = const Color(0xFF0A0616));

    // 4. Ground base
    canvas.drawRect(Rect.fromLTWH(0, horizonY, w, h - horizonY), Paint()..color = const Color(0xFF02010A));

    // 5. Perspective Grid Mesh
    final Paint gridPaint = Paint()
      ..color = const Color(0xFFD500F9).withOpacity(0.14)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (double x = -w * 0.5; x <= w * 1.5; x += 30) {
      final double endX = x;
      final double startX = w * 0.5 + (endX - w * 0.5) * 0.15;
      final bool isInsideRoad = endX > -120 && endX < w + 120;
      if (!isInsideRoad || endX < -20 || endX > w + 20) {
        canvas.drawLine(Offset(startX, horizonY), Offset(endX, h), gridPaint);
      }
    }

    final double spacingBase = 20;
    for (double gridOffset = (offset * 1.2) % spacingBase; gridOffset < h - horizonY; gridOffset += spacingBase) {
      final double progress = gridOffset / (h - horizonY);
      final double mappedY = horizonY + progress * (h - horizonY);
      final double roadW = horizonW + (w * 1.25 - horizonW) * progress;
      final double roadL = w * 0.5 - roadW / 2;
      final double roadR = w * 0.5 + roadW / 2;

      canvas.drawLine(Offset(0, mappedY), Offset(roadL, mappedY), gridPaint);
      canvas.drawLine(Offset(roadR, mappedY), Offset(w, mappedY), gridPaint);
    }

    // 6. Asphalt Road Shape
    final Path roadPath = Path();
    roadPath.moveTo(w * 0.5 - horizonW / 2, horizonY);
    roadPath.lineTo(w * 0.5 + horizonW / 2, horizonY);
    roadPath.lineTo(w + 140, h);
    roadPath.lineTo(-140, h);
    roadPath.close();
    canvas.drawPath(roadPath, Paint()..color = const Color(0xFF060510));

    // 7. Glowing Cyan Road Borders
    final Paint borderPaint = Paint()
      ..color = AppTheme.neonCyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;
    
    canvas.drawLine(Offset(w * 0.5 - horizonW / 2, horizonY), Offset(-100, h), borderPaint);
    canvas.drawLine(Offset(w * 0.5 + horizonW / 2, horizonY), Offset(w + 100, h), borderPaint);

    // 8. Dashed Lane dividers
    final double leftLaneHorizonX = w * 0.5 - horizonW / 6;
    final double leftLaneBottomX = w / 3;
    final double rightLaneHorizonX = w * 0.5 + horizonW / 6;
    final double rightLaneBottomX = (w / 3) * 2;

    final Paint laneDividerPaint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawLine(Offset(leftLaneHorizonX, horizonY), Offset(leftLaneBottomX, h), laneDividerPaint);
    canvas.drawLine(Offset(rightLaneHorizonX, horizonY), Offset(rightLaneBottomX, h), laneDividerPaint);

    // 9. Animated center dashed line
    final double dashHeight = 40;
    final double dashGap = 28;
    final double totalDash = dashHeight + dashGap;
    
    final Paint dashPaint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (double y = horizonY + (offset % totalDash); y < h; y += totalDash) {
      final double progress = (y - horizonY) / (h - horizonY);
      final double startDashY = y;
      final double endDashY = y + dashHeight * (0.2 + progress * 0.8);
      
      canvas.drawLine(Offset(w * 0.5, startDashY), Offset(w * 0.5, endDashY), dashPaint);
    }
  }

  @override
  bool shouldRepaint(covariant Road3DPainter oldDelegate) => oldDelegate.offset != offset;
}

Color _getCarColor(String key) {
  switch (key) {
    case 'jiguli': return Colors.white;
    case 'damas': return Colors.cyan;
    case 'matiz': return Colors.greenAccent;
    case 'gentra': return Colors.grey;
    case 'cobalt': return Colors.blueGrey;
    case 'malibu': return Colors.redAccent;
    case 'tesla': return AppTheme.neonCyan;
    case 'bmw': return AppTheme.neonBlue;
    case 'mers': return Colors.amberAccent;
    case 'gelik': return AppTheme.neonPurple;
    case 'lambo': return AppTheme.neonAmber;
    case 'ferrari': return AppTheme.errorRed;
    default: return AppTheme.neonAmber;
  }
}
