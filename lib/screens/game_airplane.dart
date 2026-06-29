import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/games_screen.dart';
import 'package:python_darslari/theme/theme.dart';

class GameAirplaneScreen extends StatefulWidget {
  const GameAirplaneScreen({super.key});

  @override
  State<GameAirplaneScreen> createState() => _GameAirplaneScreenState();
}

class _GameAirplaneScreenState extends State<GameAirplaneScreen> with SingleTickerProviderStateMixin {
  // Game Variables
  late List<GameQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _hearts = 3;
  bool _gameOver = false;
  bool _gameWon = false;
  bool _gameStarted = false;

  // Plane Settings
  int _planeLane = 1; // 0 = Left, 1 = Middle, 2 = Right
  double _planeAlignOffset = 0.0; // Smooth visual lane offset
  double _planeRotation = 0.0; // Dynamic visual tilt angle

  // Obstacle Settings
  double _obstacleY = -0.2; // From 0.0 to 1.0 (screen height)
  late List<String> _laneOptions; // 3 options for the 3 lanes
  late int _correctLane;
  String _selectedSpeed = 'medium'; // 'slow', 'medium', 'fast'

  Timer? _gameTimer;
  double _speed = 0.008;
  double _speedIncrement = 0.0004;
  double _spaceScrollOffset = 0.0;
  double _time = 0.0;

  // Visual pulse variables
  double _thrusterPulse = 1.0;
  bool _shieldActive = false;
  Color _shieldColor = AppTheme.neonCyan;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    final random = Random();
    final allQuestions = List<GameQuestion>.from(GamesScreen.questionBank);
    allQuestions.shuffle(random);
    _questions = allQuestions.take(10).toList();

    _currentQuestionIndex = 0;
    _score = 0;
    _hearts = 3;
    _gameOver = false;
    _gameWon = false;
    _planeLane = 1;
    _planeAlignOffset = 0.0;
    _planeRotation = 0.0;
    _obstacleY = -0.2;
    _spaceScrollOffset = 0.0;
    _shieldActive = false;

    _setupQuestion();
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
    
    _laneOptions = choices;
    _correctLane = choices.indexOf(question.answer);
    _obstacleY = -0.2;
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
    });

    // Configure speed based on selection
    if (_selectedSpeed == 'slow') {
      _speed = 0.0035;
      _speedIncrement = 0.00015;
    } else if (_selectedSpeed == 'medium') {
      _speed = 0.0055;
      _speedIncrement = 0.0003;
    } else {
      _speed = 0.0085;
      _speedIncrement = 0.0005;
    }

    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameOver || _gameWon) {
        timer.cancel();
        return;
      }

      setState(() {
        _obstacleY += _speed;
        _spaceScrollOffset += _speed * 120; // Scrolling star speed
        _time += 0.1;
        _thrusterPulse = 0.85 + sin(_time * 2) * 0.25; // Animate thruster glow

        // Interpolate lane alignment and rotation
        double targetAlignOffset = (_planeLane - 1) * 0.75;
        _planeAlignOffset += (targetAlignOffset - _planeAlignOffset) * 0.22;

        double targetRotation = (_planeLane - 1) * 0.16;
        _planeRotation += (targetRotation - _planeRotation) * 0.22;
      });

      // Check for Collision near the bottom
      if (_obstacleY >= 0.72 && _obstacleY <= 0.80) {
        _checkCollision();
      }

      // If obstacle floats past screen without hitting the correct lane
      if (_obstacleY >= 0.95) {
        _missedObstacle();
      }
    });
  }

  void _checkCollision() {
    if (_planeLane == _correctLane) {
      // Correct!
      _score++;
      _currentQuestionIndex++;
      _speed += _speedIncrement; // Slightly speed up
      _triggerShieldFlash(AppTheme.neonGreen);
      _setupQuestion();
    } else {
      // Hit incorrect choice
      _triggerShieldFlash(AppTheme.errorRed);
      _loseHeart();
    }
  }

  void _missedObstacle() {
    _triggerShieldFlash(AppTheme.errorRed);
    _loseHeart();
  }

  void _triggerShieldFlash(Color color) {
    setState(() {
      _shieldActive = true;
      _shieldColor = color;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _shieldActive = false;
        });
      }
    });
  }

  void _loseHeart() {
    setState(() {
      _hearts--;
      if (_hearts <= 0) {
        _gameOver = true;
        _gameTimer?.cancel();
      } else {
        _currentQuestionIndex++;
        _setupQuestion();
      }
    });
  }

  void _finishGame() {
    _gameTimer?.cancel();
    setState(() {
      _gameOver = true;
      _gameWon = _score >= 7;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _score > 0) {
          AppStateProvider.of(context, listen: false).addXP(_score * 10);
        }
      });
    });
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
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
            colors: [AppTheme.spaceBlack, Color(0xFF03010E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Controls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(
                            Icons.favorite_rounded,
                            color: index < _hearts ? AppTheme.errorRed : AppTheme.textMuted,
                            size: 28,
                          ),
                        );
                      }),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.glassSurface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.glassBorder),
                      ),
                      child: Text(
                        "Savol: ${_currentQuestionIndex + 1}/10",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.neonCyan,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Game Body
              Expanded(
                child: !_gameStarted
                    ? _buildStartScreen()
                    : _gameOver || _gameWon
                        ? _buildResultScreen()
                        : _buildPlayfield(currentQuestion),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartScreen() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.glassSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.neonCyan.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonCyan.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.flight_takeoff_rounded, color: AppTheme.neonCyan, size: 72),
            const SizedBox(height: 16),
            const Text(
              "Kosmik Samolyot (Space Jet)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Samolyot ustidagi Python kodiga mos keladigan to'g'ri ta'rif pufakchasini to'plang!\nTo'siqlarga tegish xato, ularni o'tkazib yuborsangiz, halokat yuz beradi.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            // Speed Selector
            const Text(
              "Tezlikni Tanlang (Speed Level):",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSpeedSelectCard('slow', 'Sekin (Slow)', AppTheme.neonGreen),
                const SizedBox(width: 8),
                _buildSpeedSelectCard('medium', 'O\'rtacha (Medium)', AppTheme.neonCyan),
                const SizedBox(width: 8),
                _buildSpeedSelectCard('fast', 'Tez (Fast)', AppTheme.neonAmber),
              ],
            ),
            
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.neonCyan,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: AppTheme.neonCyan.withOpacity(0.3),
              ),
              onPressed: _startGame,
              child: const Text(
                "UCHISHNI BOSHLASH",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeedSelectCard(String speedKey, String name, Color activeColor) {
    final isSelected = _selectedSpeed == speedKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSpeed = speedKey;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.15) : AppTheme.glassSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? activeColor : AppTheme.glassBorder,
            width: 1.5,
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? activeColor : AppTheme.textSecondary,
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

        return Stack(
          children: [
            // Parallax Galaxy Space Background Painter
            Positioned.fill(
              child: CustomPaint(
                painter: SpacePainter(scrollOffset: _spaceScrollOffset),
              ),
            ),

            // Drifting Obstacles / Lane Answers (Nebula Bubbles)
            Positioned(
              top: _obstacleY * height,
              left: 0,
              right: 0,
              child: Row(
                children: List.generate(3, (index) {
                  final text = _laneOptions[index];
                  final isTargetCollision = _obstacleY >= 0.72 && _obstacleY <= 0.80 && _planeLane == index;

                  return Container(
                    width: laneWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isTargetCollision 
                            ? (_correctLane == index ? AppTheme.neonGreen.withOpacity(0.25) : AppTheme.errorRed.withOpacity(0.25))
                            : AppTheme.spaceBlack.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isTargetCollision
                              ? (_correctLane == index ? AppTheme.neonGreen : AppTheme.errorRed)
                              : AppTheme.neonCyan.withOpacity(0.55),
                          width: 2.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.neonCyan.withOpacity(0.12),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Space Jet (Interactive Tilt, Engines, Shield Ripple overlay)
            Positioned(
              bottom: height * 0.16,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: width,
                  height: 160,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        left: (width / 2 - laneWidth / 2) + _planeAlignOffset * (laneWidth * 0.8),
                        child: Container(
                          width: laneWidth,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Keyword target code
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: AppTheme.spaceBlack,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppTheme.neonCyan, width: 1.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.neonCyan.withOpacity(0.25),
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                                child: Text(
                                  question.code,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.5,
                                    color: AppTheme.neonCyan,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              
                              // Jet Thruster Flame & Aircraft Body
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  // Flashing thruster jet fire vector
                                  Positioned(
                                    bottom: 0,
                                    child: Transform.scale(
                                      scaleX: _thrusterPulse,
                                      scaleY: _thrusterPulse * 1.3,
                                      child: Container(
                                        width: 14,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              AppTheme.neonCyan,
                                              AppTheme.neonPurple.withOpacity(0.0),
                                            ],
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Shield Glow Ripple
                                  if (_shieldActive)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: _shieldColor, width: 3),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _shieldColor.withOpacity(0.3),
                                            blurRadius: 15,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                    ),

                                  // Space Jet vector graphic
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Transform.rotate(
                                      angle: _planeRotation,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 58,
                                            height: 58,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppTheme.neonCyan.withOpacity(0.2),
                                                  blurRadius: 18,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.flight_rounded,
                                            color: AppTheme.neonCyan,
                                            size: 58,
                                          ),
                                        ],
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

            // Controls overlay (Swipe support or quick tap)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildControlBtn(
                    label: "CHAP",
                    icon: Icons.keyboard_double_arrow_left_rounded,
                    onPressed: () {
                      if (_planeLane > 0) {
                        setState(() => _planeLane--);
                      }
                    },
                  ),
                  _buildControlBtn(
                    label: "O'RTA",
                    icon: Icons.circle_outlined,
                    onPressed: () {
                      setState(() => _planeLane = 1);
                    },
                  ),
                  _buildControlBtn(
                    label: "O'NG",
                    icon: Icons.keyboard_double_arrow_right_rounded,
                    onPressed: () {
                      if (_planeLane < 2) {
                        setState(() => _planeLane++);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildControlBtn({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.glassSurface,
        foregroundColor: AppTheme.neonCyan,
        side: const BorderSide(color: AppTheme.glassBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        elevation: 0,
      ),
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      onPressed: onPressed,
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
          boxShadow: [
            BoxShadow(
              color: (_gameWon ? AppTheme.neonGreen : AppTheme.errorRed).withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
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
              _score > 0
                  ? "Siz to'g'ri javob bulutlarini to'plab, $_score ta to'g'ri javob berdingiz!\n\nHisob: $_score/10\n+${_score * 10} XP profilingizga qo'shildi!"
                  : "Parvoz halokatga uchradi. Siz barcha yuraklaringizni yo'qotdingiz yoki ball to'play olmadingiz.\n\nHisob: $_score/10",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: AppTheme.glassBorder),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Chiqish"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gameWon ? AppTheme.neonGreen : AppTheme.errorRed,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _initGame();
                      _startGame();
                    });
                  },
                  child: Text(_gameWon ? "Qayta o'ynash" : "Urinib ko'rish"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARALLAX GALAXY & MULTI-LAYER STARFIELD CUSTOM PAINTER
// -----------------------------------------------------------------
class SpacePainter extends CustomPainter {
  final double scrollOffset;
  SpacePainter({required this.scrollOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // 1. Draw Space Nebula Gradient overlays
    final Paint nebulaPaint = Paint()..style = PaintingStyle.fill;
    
    // Cyan Nebula (Top Left)
    final Rect nebula1 = Rect.fromCircle(center: Offset(w * 0.1, h * 0.2), radius: w * 0.7);
    nebulaPaint.shader = RadialGradient(
      colors: [
        const Color(0xFF00E5FF).withOpacity(0.08),
        const Color(0xFF0F172A).withOpacity(0.0),
      ],
    ).createShader(nebula1);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), nebulaPaint);

    // Purple Nebula (Bottom Right)
    final Rect nebula2 = Rect.fromCircle(center: Offset(w * 0.9, h * 0.8), radius: w * 0.7);
    nebulaPaint.shader = RadialGradient(
      colors: [
        const Color(0xFFD500F9).withOpacity(0.08),
        const Color(0xFF070913).withOpacity(0.0),
      ],
    ).createShader(nebula2);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), nebulaPaint);

    // 2. Parallax Layer 1: Distant Tiny Stars (Slow Scroll)
    final Paint starPaint = Paint()..color = Colors.white;
    final random1 = Random(77); // Seeded for consistency
    for (int i = 0; i < 40; i++) {
      final double x = random1.nextDouble() * w;
      final double baseY = random1.nextDouble() * h;
      // Scroll offset applied at factor 0.25 (slow)
      final double y = (baseY + scrollOffset * 0.25) % h;
      
      final double pulse = sin(scrollOffset * 0.03 + i) * 0.35 + 0.65;
      starPaint.color = Colors.white.withOpacity(0.25 * pulse);
      canvas.drawCircle(Offset(x, y), 0.8 * pulse, starPaint);
    }

    // 3. Parallax Layer 2: Medium Stars (Medium Scroll)
    final random2 = Random(123);
    for (int i = 0; i < 20; i++) {
      final double x = random2.nextDouble() * w;
      final double baseY = random2.nextDouble() * h;
      // Scroll offset applied at factor 0.6 (medium)
      final double y = (baseY + scrollOffset * 0.6) % h;
      
      final double pulse = cos(scrollOffset * 0.04 + i) * 0.3 + 0.7;
      starPaint.color = const Color(0xFF00E5FF).withOpacity(0.45 * pulse);
      canvas.drawCircle(Offset(x, y), 1.5 * pulse, starPaint);
    }

    // 4. Parallax Layer 3: Cosmic Dust / Falling Meteors (Fast Scroll)
    final random3 = Random(456);
    for (int i = 0; i < 8; i++) {
      final double x = random3.nextDouble() * w;
      final double baseY = random3.nextDouble() * h;
      // Scroll offset applied at factor 1.5 (fast)
      final double y = (baseY + scrollOffset * 1.5) % h;
      
      final double pulse = sin(scrollOffset * 0.08 + i) * 0.4 + 0.6;
      final Paint linePaint = Paint()
        ..color = const Color(0xFFD500F9).withOpacity(0.35 * pulse)
        ..strokeWidth = 1.2;
      
      // Draw meteor speed lines
      canvas.drawLine(Offset(x, y), Offset(x, y + 14 * pulse), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpacePainter oldDelegate) => oldDelegate.scrollOffset != scrollOffset;
}
