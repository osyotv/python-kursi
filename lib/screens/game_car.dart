import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/games_screen.dart';
import 'package:python_darslari/screens/garage_screen.dart';
import 'package:python_darslari/theme/theme.dart';

class GameCarScreen extends StatefulWidget {
  const GameCarScreen({super.key});

  @override
  State<GameCarScreen> createState() => _GameCarScreenState();
}

class _GameCarScreenState extends State<GameCarScreen> with SingleTickerProviderStateMixin {
  // Game Variables
  late List<GameQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _hearts = 3;
  bool _gameOver = false;
  bool _gameWon = false;
  bool _gameStarted = false;

  // Car Settings
  int _carLane = 1; // 0 = Left, 1 = Middle, 2 = Right
  double _carAlignOffset = 0.0; // Dynamic visual offset for smooth lane switches
  String _selectedCar = 'jiguli';
  String _selectedSpeed = 'medium'; // 'slow', 'medium', 'fast'

  // Wall/Gate Settings
  double _wallY = -0.2; // From 0.0 to 1.0
  late List<String> _gateOptions;
  late int _correctGate;

  Timer? _gameTimer;
  double _speed = 0.0035; // Speed factor
  double _speedIncrement = 0.0002;
  double _roadOffset = 0.0; // Parallax road offset

  // Crash animation controller
  late AnimationController _crashAnimController;
  late Animation<double> _shakeAnim;

  // Visual underglow pulse
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
    _carLane = 1;
    _carAlignOffset = 0.0;
    _wallY = -0.2;
    _roadOffset = 0.0;

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

    _gateOptions = choices;
    _correctGate = choices.indexOf(question.answer);
    _wallY = -0.2;
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
    });

    // Configure speed constants based on selection
    if (_selectedSpeed == 'slow') {
      _speed = 0.0022;
      _speedIncrement = 0.00012;
    } else if (_selectedSpeed == 'medium') {
      _speed = 0.0038;
      _speedIncrement = 0.00022;
    } else {
      _speed = 0.0062;
      _speedIncrement = 0.00038;
    }

    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameOver || _gameWon) {
        timer.cancel();
        return;
      }

      setState(() {
        _wallY += _speed;
        _roadOffset += _speed * 60; // Scroll road stripes downwards
        _time += 0.05;
        _glowPulse = sin(_time) * 4.0;
        
        // Smoothly interpolate lane adjustment
        double targetAlignOffset = (_carLane - 1) * 0.75;
        _carAlignOffset += (targetAlignOffset - _carAlignOffset) * 0.25;
      });

      // Collision trigger point
      if (_wallY >= 0.72 && _wallY <= 0.80) {
        _checkCollision();
      }

      // If obstacle wall passes without matching
      if (_wallY >= 0.95) {
        _missedWall();
      }
    });
  }

  void _checkCollision() {
    if (_carLane == _correctGate) {
      // Correct Gate! Clean Pass
      _score++;
      _currentQuestionIndex++;
      _speed += _speedIncrement; // Speed up
      _setupQuestion();
    } else {
      // Crashed!
      _triggerCrash();
    }
  }

  void _missedWall() {
    _triggerCrash();
  }

  void _triggerCrash() {
    _crashAnimController.forward(from: 0.0);
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
    _crashAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    if (!_gameStarted) {
      _selectedCar = state.activeCarKey;
    }

    final currentQuestion = _currentQuestionIndex < _questions.length
        ? _questions[_currentQuestionIndex]
        : _questions.last;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.spaceBlack, Color(0xFF0A081A)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header UI
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
                          color: AppTheme.neonAmber,
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
          border: Border.all(color: AppTheme.neonAmber.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonAmber.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.directions_car_filled_rounded, color: AppTheme.neonAmber, size: 68),
              const SizedBox(height: 10),
              const Text(
                "3D Kiber Poyga (Cyber Highway)",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Moshina tomidagi Python kodiga mos keladigan to'g'ri ta'rif devorini buzib o'ting!\nYo'lakni o'zgartirish uchun ekranning kerakli tarafiga bosing.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              
              // Speed Selector
              const Text(
                "Tezlikni Tanlang (Speed Level):",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 20),
              
              // Equipped Car Info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.glassBorder),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/$_selectedCar.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.directions_car_filled_rounded, color: _getCarColor(_selectedCar), size: 44),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "FAOL MASHINA (ACTIVE CAR)",
                            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.neonAmber),
                          ),
                          Text(
                            _getCarName(_selectedCar),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.glassSurface,
                        foregroundColor: AppTheme.neonCyan,
                        side: const BorderSide(color: AppTheme.glassBorder),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GarageScreen()),
                        ).then((_) {
                          setState(() {
                            _selectedCar = AppStateProvider.of(context, listen: false).activeCarKey;
                          });
                        });
                      },
                      child: const Text("O'zgartirish", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.neonAmber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 10,
                  shadowColor: AppTheme.neonAmber.withOpacity(0.4),
                ),
                onPressed: _startGame,
                child: const Text(
                  "POYGANI BOSHLASH",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.8),
                ),
              ),
            ],
          ),
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
            // 3D Perspective Cyber-Highway Custom Paint
            Positioned.fill(
              child: CustomPaint(
                painter: Road3DPainter(offset: _roadOffset),
              ),
            ),

            // Approaching Obstacle Walls / Gate Options
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
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isCollision 
                                ? (isGateCorrect ? AppTheme.neonGreen.withOpacity(0.3) : AppTheme.errorRed.withOpacity(0.3))
                                : AppTheme.spaceBlack.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isCollision
                                  ? (isGateCorrect ? AppTheme.neonGreen : AppTheme.errorRed)
                                  : AppTheme.neonAmber.withOpacity(0.55),
                              width: 2.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isGateCorrect ? AppTheme.neonCyan.withOpacity(0.15) : AppTheme.neonAmber.withOpacity(0.15),
                                blurRadius: 12,
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
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Sports Car (Custom Image Sprite with shake crash & underglow neon lights)
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
                        // Alignment based on continuous _carAlignOffset
                        Positioned(
                          left: (width / 2 - laneWidth / 2) + _carAlignOffset * (laneWidth * 0.8),
                          child: Container(
                            width: laneWidth,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Keyword Code on Top of the Car
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                                      fontSize: 13.5,
                                      color: _getCarColor(_selectedCar),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // Neon Underglow shadow
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _crashAnimController.isAnimating
                                                ? AppTheme.errorRed.withOpacity(0.8)
                                                : _getCarColor(_selectedCar).withOpacity(0.65),
                                            blurRadius: 18 + _glowPulse,
                                            spreadRadius: 4 + _glowPulse / 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    // Premium selected car sprite image
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Transform.rotate(
                                        // Slight tilt based on lane switch velocity
                                        angle: -(_carAlignOffset - (_carLane - 1) * 0.75) * 0.2,
                                        child: Image.asset(
                                          'assets/images/$_selectedCar.png',
                                          height: 104,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.directions_car_filled_rounded, 
                                              color: _getCarColor(_selectedCar), 
                                              size: 64
                                            );
                                          },
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

            // Tap Detectors over the 3 Lanes
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

            // Helper text
            const Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Boshqarish: Ekranning chap / o'rtacha / o'ng qismiga bosing",
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
                  ? "Siz to'g'ri javob devorlarini urib, $_score ta to'g'ri javob berdingiz!\n\nHisob: $_score/10\n+${_score * 10} XP profilingizga qo'shildi!"
                  : "Moshina pachoq bo'ldi. Siz barcha yuraklaringizni yo'qotdingiz yoki ball to'play olmadingiz.\n\nHisob: $_score/10",
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
// HIGH-FIDELITY CYBERPUNK 3D PARALLAX ROAD & CYBER-GRID CUSTOM PAINTER
// -----------------------------------------------------------------
class Road3DPainter extends CustomPainter {
  final double offset;
  Road3DPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Horizon line
    final double horizonY = h * 0.18;
    final double horizonW = w * 0.16;

    // 1. Draw a beautiful Cyber Sunset Sky Gradient
    final Rect skyRect = Rect.fromLTWH(0, 0, w, horizonY);
    final Paint skyPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF03010E),
          Color(0xFF0A041E),
          Color(0xFF210238),
          Color(0xFF42024A),
          Color(0xFF130122),
        ],
      ).createShader(skyRect);
    canvas.drawRect(skyRect, skyPaint);

    // 2. Draw Stars & Cyber Sun in sky
    final Paint starPaint = Paint()..color = Colors.white.withOpacity(0.6);
    final random = Random(42); // Seeded random for consistent stars
    for (int i = 0; i < 24; i++) {
      final double starX = random.nextDouble() * w;
      final double starY = random.nextDouble() * horizonY;
      final double starRadius = random.nextDouble() * 1.5;
      
      // Star pulse
      final double pulse = sin(offset * 0.05 + i) * 0.3 + 0.7;
      starPaint.color = Colors.white.withOpacity(0.3 + pulse * 0.4);
      canvas.drawCircle(Offset(starX, starY), starRadius * pulse, starPaint);
    }

    // Cyber Sun on Horizon Center
    final Paint sunPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFF50057).withOpacity(0.9),
          const Color(0xFFFF8A00).withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(w * 0.5, horizonY), radius: 50));
    canvas.drawCircle(Offset(w * 0.5, horizonY), 40, sunPaint);

    // 3. Draw Sunset Mountains / Landscape Silhouettes
    final Path mountainsPath = Path();
    mountainsPath.moveTo(0, horizonY);
    mountainsPath.lineTo(w * 0.15, horizonY - 25);
    mountainsPath.lineTo(w * 0.3, horizonY - 12);
    mountainsPath.lineTo(w * 0.45, horizonY - 45);
    mountainsPath.lineTo(w * 0.55, horizonY - 45);
    mountainsPath.lineTo(w * 0.65, horizonY - 15);
    mountainsPath.lineTo(w * 0.8, horizonY - 32);
    mountainsPath.lineTo(w, horizonY);
    mountainsPath.close();
    
    final Paint mountainPaint = Paint()..color = const Color(0xFF0D081B);
    canvas.drawPath(mountainsPath, mountainPaint);

    final Paint mountainOutline = Paint()
      ..color = const Color(0xFFF50057).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(mountainsPath, mountainOutline);

    // 4. Fill Lower Ground with dark grid base
    final Paint groundPaint = Paint()..color = const Color(0xFF03010E);
    canvas.drawRect(Rect.fromLTWH(0, horizonY, w, h - horizonY), groundPaint);

    // 5. Draw Perspective Grid Mesh on left and right sides
    final Paint gridLinePaint = Paint()
      ..color = const Color(0xFFD500F9).withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // Longitudinal grid lines (radiating from horizon center to sides)
    for (double x = -w * 0.5; x <= w * 1.5; x += 35) {
      // Avoid drawing lines that enter the road area
      final double endX = x;
      final double startX = w * 0.5 + (endX - w * 0.5) * 0.15;
      
      // Only draw if outside road borders roughly
      final bool isInsideRoad = endX > -100 && endX < w + 100;
      if (!isInsideRoad || endX < -20 || endX > w + 20) {
        canvas.drawLine(Offset(startX, horizonY), Offset(endX, h), gridLinePaint);
      }
    }

    // Transverse/Horizontal grid lines scrolling down in perspective
    final double spacingBase = 22;
    for (double gridOffset = (offset * 1.2) % spacingBase; gridOffset < h - horizonY; gridOffset += spacingBase) {
      // Map linear offset to exponential perspective progression
      final double progress = gridOffset / (h - horizonY);
      final double mappedY = horizonY + progress * (h - horizonY);
      
      // Calculate width at this specific Y
      final double roadW = horizonW + (w * 1.2 - horizonW) * progress;
      final double roadL = w * 0.5 - roadW / 2;
      final double roadR = w * 0.5 + roadW / 2;

      // Draw horizontal grid line segments (skipping road)
      canvas.drawLine(Offset(0, mappedY), Offset(roadL, mappedY), gridLinePaint);
      canvas.drawLine(Offset(roadR, mappedY), Offset(w, mappedY), gridLinePaint);
    }

    // 6. Draw Asphalt Road Perspective Shape
    final Path roadPath = Path();
    roadPath.moveTo(w * 0.5 - horizonW / 2, horizonY);
    roadPath.lineTo(w * 0.5 + horizonW / 2, horizonY);
    roadPath.lineTo(w + 120, h);
    roadPath.lineTo(-120, h);
    roadPath.close();
    
    final Paint asphaltPaint = Paint()..color = const Color(0xFF080614);
    canvas.drawPath(roadPath, asphaltPaint);

    // 7. Draw Road Borders (Glowing Cyan Neon lines)
    final Paint borderPaint = Paint()
      ..color = AppTheme.neonCyan
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;
    
    final Paint borderGlowPaint = Paint()
      ..color = AppTheme.neonCyan.withOpacity(0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    
    // Left border
    canvas.drawLine(Offset(w * 0.5 - horizonW / 2, horizonY), Offset(-80, h), borderGlowPaint);
    canvas.drawLine(Offset(w * 0.5 - horizonW / 2, horizonY), Offset(-80, h), borderPaint);
    
    // Right border
    canvas.drawLine(Offset(w * 0.5 + horizonW / 2, horizonY), Offset(w + 80, h), borderGlowPaint);
    canvas.drawLine(Offset(w * 0.5 + horizonW / 2, horizonY), Offset(w + 80, h), borderPaint);

    // 8. Draw Lane Dividers (Dashed Perspective Lines)
    final double leftLaneHorizonX = w * 0.5 - horizonW / 6;
    final double leftLaneBottomX = w / 3;
    final double rightLaneHorizonX = w * 0.5 + horizonW / 6;
    final double rightLaneBottomX = (w / 3) * 2;

    final Paint laneDividerPaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawLine(Offset(leftLaneHorizonX, horizonY), Offset(leftLaneBottomX, h), laneDividerPaint);
    canvas.drawLine(Offset(rightLaneHorizonX, horizonY), Offset(rightLaneBottomX, h), laneDividerPaint);

    // 9. Draw animated middle dashed line to show motion
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
      
      canvas.drawLine(
        Offset(w * 0.5, startDashY),
        Offset(w * 0.5, endDashY),
        dashPaint,
      );
    }

    // 10. Draw perspective side neon light posts
    final double postSpacing = 100;
    for (double y = horizonY + (offset % postSpacing); y < h; y += postSpacing) {
      final double progress = (y - horizonY) / (h - horizonY);
      final double postSize = 5 + progress * 15;

      // Calculate border positions at this specific Y
      final double roadW = horizonW + (w * 1.2 - horizonW) * progress;
      final double leftMarginX = w * 0.5 - roadW / 2;
      final double rightMarginX = w * 0.5 + roadW / 2;

      // Draw light poles (neon sticks)
      final Paint polePaint = Paint()
        ..color = AppTheme.neonPurple
        ..strokeWidth = 1.5 + progress * 3
        ..style = PaintingStyle.stroke;

      // Left neon pole
      canvas.drawLine(Offset(leftMarginX - 10 * progress, y), Offset(leftMarginX - 10 * progress, y - postSize * 1.8), polePaint);
      canvas.drawCircle(Offset(leftMarginX - 10 * progress, y - postSize * 1.8), postSize * 0.25, Paint()..color = AppTheme.neonCyan);

      // Right neon pole
      canvas.drawLine(Offset(rightMarginX + 10 * progress, y), Offset(rightMarginX + 10 * progress, y - postSize * 1.8), polePaint);
      canvas.drawCircle(Offset(rightMarginX + 10 * progress, y - postSize * 1.8), postSize * 0.25, Paint()..color = AppTheme.neonCyan);
    }
  }

  @override
  bool shouldRepaint(covariant Road3DPainter oldDelegate) => oldDelegate.offset != offset;
}

// Helpers
String _getCarName(String key) {
  switch (key) {
    case 'jiguli': return 'VAZ-2106 (Jiguli)';
    case 'damas': return 'Chevrolet Damas';
    case 'matiz': return 'Chevrolet Matiz';
    case 'gentra': return 'Qora Gentra';
    case 'cobalt': return 'Chevrolet Cobalt';
    case 'malibu': return 'Chevrolet Malibu 2';
    case 'tesla': return 'Tesla Model S';
    case 'bmw': return 'BMW M5 F90';
    case 'mers': return 'Mercedes S-Class';
    case 'gelik': return 'Gelik G-Class';
    case 'lambo': return 'Lamborghini Aventador';
    case 'ferrari': return 'Ferrari LaFerrari';
    default: return 'Mashina';
  }
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
