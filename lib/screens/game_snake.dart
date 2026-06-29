import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/games_screen.dart';
import 'package:python_darslari/theme/theme.dart';

enum Direction { up, down, left, right }

class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

class GameSnakeScreen extends StatefulWidget {
  const GameSnakeScreen({super.key});

  @override
  State<GameSnakeScreen> createState() => _GameSnakeScreenState();
}

class _GameSnakeScreenState extends State<GameSnakeScreen> {
  static const int _gridSize = 14;

  // Game variables
  late List<GameQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _hearts = 3;
  bool _gameOver = false;
  bool _gameWon = false;
  bool _gameStarted = false;

  // Snake body and direction
  List<Point> _snake = [];
  Direction _direction = Direction.right;

  // Food variables
  late Point _foodA;
  late Point _foodB;
  late Point _foodC;
  late List<String> _choices;
  late int _correctChoiceIndex; // 0 = A, 1 = B, 2 = C
  String _selectedSpeed = 'medium'; // 'slow', 'medium', 'fast'

  Timer? _gameTimer;
  int _timerSpeed = 260; // ms per tick

  // Feedback flashes
  bool _gridFlash = false;
  Color _flashColor = AppTheme.neonGreen;

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
    _direction = Direction.right;
    _gridFlash = false;

    // Place initial snake in center
    _snake = [
      const Point(5, 7),
      const Point(4, 7),
      const Point(3, 7),
    ];

    _setupQuestion();
  }

  void _setupQuestion() {
    if (_currentQuestionIndex >= _questions.length) {
      _finishGame();
      return;
    }

    final question = _questions[_currentQuestionIndex];
    final random = Random();

    // Shuffle options
    final choices = List<String>.from(question.choices);
    choices.shuffle(random);

    _choices = choices;
    _correctChoiceIndex = choices.indexOf(question.answer);

    _spawnFoods();
  }

  void _spawnFoods() {
    final random = Random();

    Point getRandomPoint() {
      while (true) {
        final x = random.nextInt(_gridSize);
        final y = random.nextInt(_gridSize);
        final p = Point(x, y);

        // Make sure it doesn't overlap with snake body
        if (!_snake.contains(p)) {
          return p;
        }
      }
    }

    _foodA = getRandomPoint();
    
    // Ensure B doesn't overlap with A
    do {
      _foodB = getRandomPoint();
    } while (_foodB == _foodA);

    // Ensure C doesn't overlap with A or B
    do {
      _foodC = getRandomPoint();
    } while (_foodC == _foodA || _foodC == _foodB);
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
    });

    // Configure tick rate based on speed selector
    if (_selectedSpeed == 'slow') {
      _timerSpeed = 380;
    } else if (_selectedSpeed == 'medium') {
      _timerSpeed = 260;
    } else {
      _timerSpeed = 160;
    }

    _gameTimer = Timer.periodic(Duration(milliseconds: _timerSpeed), (timer) {
      if (_gameOver || _gameWon) {
        timer.cancel();
        return;
      }
      _moveSnake();
    });
  }

  void _moveSnake() {
    if (!mounted) return;
    setState(() {
      // Calculate next head position
      final head = _snake.first;
      int nextX = head.x;
      int nextY = head.y;

      switch (_direction) {
        case Direction.up:
          nextY--;
          break;
        case Direction.down:
          nextY++;
          break;
        case Direction.left:
          nextX--;
          break;
        case Direction.right:
          nextX++;
          break;
      }

      final nextHead = Point(nextX, nextY);

      // Check boundary/wall collision
      if (nextX < 0 || nextX >= _gridSize || nextY < 0 || nextY >= _gridSize) {
        _handleWallOrSelfCollision();
        return;
      }

      // Check self collision (ignoring tail tip since it moves)
      if (_snake.contains(nextHead) && nextHead != _snake.last) {
        _handleWallOrSelfCollision();
        return;
      }

      // Insert new head
      _snake.insert(0, nextHead);

      // Check if food was eaten
      if (nextHead == _foodA) {
        _eatFood(0);
      } else if (nextHead == _foodB) {
        _eatFood(1);
      } else if (nextHead == _foodC) {
        _eatFood(2);
      } else {
        // Normal move, remove tail
        _snake.removeLast();
      }
    });
  }

  void _eatFood(int eatenIndex) {
    if (eatenIndex == _correctChoiceIndex) {
      // Eaten CORRECT food!
      _score++;
      _currentQuestionIndex++;
      _triggerFlash(AppTheme.neonGreen);
      _setupQuestion();
    } else {
      // Eaten WRONG food
      _snake.removeLast(); // Do not grow
      _triggerFlash(AppTheme.errorRed);
      _loseHeart();
    }
  }

  void _triggerFlash(Color color) {
    setState(() {
      _gridFlash = true;
      _flashColor = color;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _gridFlash = false;
        });
      }
    });
  }

  void _handleWallOrSelfCollision() {
    _triggerFlash(AppTheme.errorRed);
    // Reset snake in the center
    _snake = [
      const Point(5, 7),
      const Point(4, 7),
      const Point(3, 7),
    ];
    _direction = Direction.right;
    _loseHeart();
  }

  void _loseHeart() {
    _hearts--;
    if (_hearts <= 0) {
      _gameOver = true;
      _gameTimer?.cancel();
    } else {
      _spawnFoods();
    }
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

  // Handle Swipe directions
  void _handleSwipe(DragEndDetails details) {
    final velocityX = details.velocity.pixelsPerSecond.dx;
    final velocityY = details.velocity.pixelsPerSecond.dy;

    setState(() {
      if (velocityX.abs() > velocityY.abs()) {
        // Horizontal swipe
        if (velocityX > 0 && _direction != Direction.left) {
          _direction = Direction.right;
        } else if (velocityX < 0 && _direction != Direction.right) {
          _direction = Direction.left;
        }
      } else {
        // Vertical swipe
        if (velocityY > 0 && _direction != Direction.up) {
          _direction = Direction.down;
        } else if (velocityY < 0 && _direction != Direction.down) {
          _direction = Direction.up;
        }
      }
    });
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
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanEnd: _handleSwipe, // Swipe gestures on playfield!
            child: Column(
              children: [
                // Header UI
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            color: AppTheme.neonGreen,
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
          border: Border.all(color: AppTheme.neonGreen.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonGreen.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 2,
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.gesture_rounded, color: AppTheme.neonGreen, size: 72),
            const SizedBox(height: 16),
            const Text(
              "Kiber Iloncha (Cyber Snake)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Ekranni surish (Swipe) yoki D-Pad orqali ilonchani boshqaring. Python kodiga mos to'g'ri ta'rif yorlig'ini (A, B yoki C) yeng!\nDevorlarga yoki o'z tanangizga urilmang.",
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
                backgroundColor: AppTheme.neonGreen,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: AppTheme.neonGreen.withOpacity(0.3),
              ),
              onPressed: _startGame,
              child: const Text(
                "O'YINNI BOSHLASH",
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
    return Column(
      children: [
        // Question Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.spaceBlack,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.neonGreen, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppTheme.neonGreen.withOpacity(0.12),
                blurRadius: 10,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "KOD:  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMuted,
                  fontSize: 13,
                ),
              ),
              Text(
                question.code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.5,
                  color: AppTheme.neonGreen,
                ),
              ),
            ],
          ),
        ),

        // Cyber-Neon Grid Area
        Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            color: AppTheme.spaceBlack,
            border: Border.all(
              color: _gridFlash ? _flashColor : AppTheme.glassBorder, 
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: (_gridFlash ? _flashColor : AppTheme.neonGreen).withOpacity(0.06),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // Scanlines / cyber matrix grid background
                Positioned.fill(
                  child: CustomPaint(
                    painter: GridBgPainter(),
                  ),
                ),
                
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _gridSize * _gridSize,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridSize,
                  ),
                  itemBuilder: (context, index) {
                    final x = index % _gridSize;
                    final y = index ~/ _gridSize;
                    final p = Point(x, y);

                    final isHead = _snake.isNotEmpty && _snake.first == p;
                    final isBody = _snake.contains(p) && !isHead;
                    
                    Widget? cellChild;
                    BoxDecoration cellDeco = const BoxDecoration();

                    if (isHead) {
                      cellDeco = BoxDecoration(
                        color: AppTheme.neonGreen,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.neonGreen.withOpacity(0.8),
                            blurRadius: 8,
                          )
                        ],
                      );

                      cellChild = Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(width: 3, height: 3, decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
                            Container(width: 3, height: 3, decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
                          ],
                        ),
                      );
                    } else if (isBody) {
                      // Gradient tapering tail transparency
                      int bodyIndex = _snake.indexOf(p);
                      double ratio = bodyIndex / _snake.length;
                      cellDeco = BoxDecoration(
                        color: AppTheme.neonGreen.withOpacity(0.85 - ratio * 0.5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black12, width: 0.5),
                      );
                    } else if (p == _foodA) {
                      cellDeco = BoxDecoration(
                        color: AppTheme.neonCyan.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.neonCyan, width: 1.5),
                      );
                      cellChild = const Center(
                        child: Text(
                          "A",
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.neonCyan, fontSize: 12),
                        ),
                      );
                    } else if (p == _foodB) {
                      cellDeco = BoxDecoration(
                        color: AppTheme.errorRed.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.errorRed, width: 1.5),
                      );
                      cellChild = const Center(
                        child: Text(
                          "B",
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.errorRed, fontSize: 12),
                        ),
                      );
                    } else if (p == _foodC) {
                      cellDeco = BoxDecoration(
                        color: AppTheme.neonAmber.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.neonAmber, width: 1.5),
                      );
                      cellChild = const Center(
                        child: Text(
                          "C",
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.neonAmber, fontSize: 12),
                        ),
                      );
                    }

                    return Container(
                      margin: const EdgeInsets.all(1),
                      decoration: cellDeco,
                      child: cellChild,
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // List Answers & D-Pad Controls
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            children: [
              // Answer Legend (A, B, C cards)
              Row(
                children: [
                  _buildLegendCard("A", _choices[0], AppTheme.neonCyan),
                  const SizedBox(width: 8),
                  _buildLegendCard("B", _choices[1], AppTheme.errorRed),
                  const SizedBox(width: 8),
                  _buildLegendCard("C", _choices[2], AppTheme.neonAmber),
                ],
              ),
              const SizedBox(height: 12),

              // Game controls (D-Pad)
              Center(
                child: SizedBox(
                  width: 150,
                  height: 110,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: _buildDPadBtn(Direction.up, Icons.keyboard_arrow_up_rounded),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _buildDPadBtn(Direction.down, Icons.keyboard_arrow_down_rounded),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildDPadBtn(Direction.left, Icons.keyboard_arrow_left_rounded),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _buildDPadBtn(Direction.right, Icons.keyboard_arrow_right_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendCard(String label, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: AppTheme.glassSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.35)),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              radius: 12,
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 11),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10.5, color: Colors.white, height: 1.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDPadBtn(Direction dir, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Prevent reversing onto self
        if (dir == Direction.up && _direction == Direction.down) return;
        if (dir == Direction.down && _direction == Direction.up) return;
        if (dir == Direction.left && _direction == Direction.right) return;
        if (dir == Direction.right && _direction == Direction.left) return;
        setState(() => _direction = dir);
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppTheme.glassSurface,
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.neonGreen.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.neonGreen.withOpacity(0.1),
              blurRadius: 6,
            )
          ]
        ),
        child: Icon(icon, color: AppTheme.neonGreen, size: 28),
      ),
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
                  ? "Siz iloncha bilan to'g'ri ta'riflarni yeb, $_score ta to'g'ri javob berdingiz!\n\nHisob: $_score/10\n+${_score * 10} XP profilingizga qo'shildi!"
                  : "Afsus, siz barcha yuraklaringizni yo'qotdingiz yoki ball to'play olmadingiz.\n\nHisob: $_score/10",
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

// Custom Grid Cyber Background Painter
class GridBgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final int gridCount = 14;
    final double stepX = w / gridCount;
    final double stepY = h / gridCount;

    final Paint linePaint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw vertical lines
    for (int i = 1; i < gridCount; i++) {
      canvas.drawLine(Offset(i * stepX, 0), Offset(i * stepX, h), linePaint);
    }
    // Draw horizontal lines
    for (int i = 1; i < gridCount; i++) {
      canvas.drawLine(Offset(0, i * stepY), Offset(w, i * stepY), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant GridBgPainter oldDelegate) => false;
}
