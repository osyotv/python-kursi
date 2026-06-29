import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/data/lessons_data.dart';
import 'package:python_darslari/data/quiz_generator.dart';
import 'package:python_darslari/theme/theme.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  final int examNumber;
  final List<Lesson> blockLessons;

  const QuizScreen({
    super.key,
    required this.examNumber,
    required this.blockLessons,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  late List<QuizQuestion> _quizQuestions;
  int _currentQuestionIndex = 0;
  
  int _selectedOptionIndex = -1;
  bool _hasChecked = false;
  bool _isCorrect = false;
  int _correctAnswersCount = 0;
  bool _isCompleting = false; // Exploit prevention lock

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _prepareQuestions();

    // Setup shake animation for incorrect answers
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0.0, end: 10.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);
  }

  void _prepareQuestions() {
    // Generate exactly 50 MCQ questions dynamically from the 5 block lessons
    _quizQuestions = QuizGenerator.generateBlockQuiz(widget.examNumber, widget.blockLessons);
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _checkAnswer() {
    if (_hasChecked || _selectedOptionIndex == -1) return;
    
    final correctIdx = _quizQuestions[_currentQuestionIndex].correctOptionIndex;
    final isCorrect = _selectedOptionIndex == correctIdx;

    setState(() {
      _hasChecked = true;
      _isCorrect = isCorrect;
      
      if (isCorrect) {
        _correctAnswersCount++;
      } else {
        _shakeController.forward(from: 0.0);
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
        _hasChecked = false;
        _isCorrect = false;
      });
    } else {
      // Completed the 50-question block exam!
      if (_isCompleting) return; // STRICT EXPLOIT PREVENTION: Block multiple clicks
      
      setState(() {
        _isCompleting = true;
      });

      final state = AppStateProvider.of(context, listen: false);
      final double percentage = _correctAnswersCount / 50;
      final bool passed = percentage >= 0.8;
      
      int xpGained = 0;
      if (passed) {
        // Enforce Firestore & Local save only once
        state.markQuizCompleted(widget.examNumber, score: _correctAnswersCount, totalQuestions: 50);
        xpGained = (_correctAnswersCount == 50) ? 100 : 20;
      }
      
      _showResultDialog(passed, xpGained);
    }
  }

  void _showResultDialog(bool passed, int xpGained) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.92),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, anim1, anim2) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: AppTheme.glassDecoration(
                hasGlow: passed,
                color: passed ? AppTheme.glassSurface : const Color(0xFF1E1313).withOpacity(0.9),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    passed ? Icons.emoji_events_rounded : Icons.info_outline_rounded,
                    color: passed ? Colors.amber : AppTheme.errorRed,
                    size: 72,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    passed ? 'Tabriklaymiz!' : 'Afsuski...',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: passed ? AppTheme.textPrimary : AppTheme.errorRed,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    passed
                        ? 'Siz ${widget.examNumber}-imtihondan muvaffaqiyatli o\'tdingiz!'
                        : 'Siz imtihondan o\'ta olmadingiz. Keyingi imtihonlarni ochish uchun kamida 80% (40 ta to\'g\'ri javob) kerak.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Score summary row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSummaryStat('To\'g\'ri javoblar', '$_correctAnswersCount/50', passed ? AppTheme.successGreen : AppTheme.errorRed),
                      if (passed)
                        _buildSummaryStat('Mukofot XP', '+$xpGained XP', AppTheme.neonCyan),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Actions
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // pop dialog
                      Navigator.of(context).pop(); // pop quiz screen
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: passed ? AppTheme.primaryGradient : null,
                        color: passed ? null : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        height: 52,
                        alignment: Alignment.center,
                        child: Text(
                          passed ? 'Bosh sahifaga qaytish' : 'Qayta urinish',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: passed ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Imtihon')),
        body: const Center(
          child: Text('Ushbu darslarda testlar topilmadi.'),
        ),
      );
    }

    final question = _quizQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _quizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.examNumber}-Imtihon'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppTheme.glassSurface,
                title: const Text('Imtihondan chiqish?'),
                content: const Text('Hozir chiqsangiz, natijalaringiz saqlanmaydi.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Bekor qilish'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // pop dialog
                      Navigator.pop(context); // pop quiz screen
                    },
                    child: const Text('Chiqish', style: TextStyle(color: AppTheme.errorRed)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Container(
                            height: 6,
                            color: Colors.white.withOpacity(0.08),
                          ),
                          FractionallySizedBox(
                            widthFactor: progress,
                            child: Container(
                              height: 6,
                              decoration: const BoxDecoration(
                                  gradient: AppTheme.accentGradient),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${_currentQuestionIndex + 1}/50',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question box card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: AppTheme.glassDecoration(opacity: 0.9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.neonCyan.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Savol ${_currentQuestionIndex + 1}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.neonCyan,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            question.question,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Variantlardan birini tanlang:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // MCQ Option Buttons wrapped in shake animation
                    AnimatedBuilder(
                      animation: _shakeAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_shakeAnimation.value * sin(2 * pi * _shakeAnimation.value), 0),
                          child: child,
                        );
                      },
                      child: Column(
                        children: List.generate(question.options.length, (idx) {
                          final optionText = question.options[idx];
                          final isSelected = _selectedOptionIndex == idx;
                          final isCorrectIdx = question.correctOptionIndex == idx;

                          Color borderCol = AppTheme.glassBorder;
                          Color bgCol = const Color(0xFF0D0F1B).withOpacity(0.6);
                          Color textCol = Colors.white;

                          if (isSelected) {
                            borderCol = AppTheme.neonCyan;
                            bgCol = AppTheme.neonCyan.withOpacity(0.05);
                          }

                          if (_hasChecked) {
                            if (isCorrectIdx) {
                              borderCol = AppTheme.successGreen;
                              bgCol = AppTheme.successGreen.withOpacity(0.1);
                              textCol = AppTheme.successGreen;
                            } else if (isSelected && !isCorrectIdx) {
                              borderCol = AppTheme.errorRed;
                              bgCol = AppTheme.errorRed.withOpacity(0.1);
                              textCol = AppTheme.errorRed;
                            }
                          }

                          return GestureDetector(
                            onTap: () {
                              if (_hasChecked) return;
                              setState(() {
                                _selectedOptionIndex = idx;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: bgCol,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: borderCol, width: 1.5),
                              ),
                              child: Row(
                                children: [
                                  // Letter badge (A, B, C, D)
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected 
                                          ? AppTheme.neonCyan 
                                          : Colors.white.withOpacity(0.06),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      String.fromCharCode(65 + idx), // A, B, C, D
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected ? Colors.black : AppTheme.textSecondary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      optionText,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textCol,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.glassBorder, width: 1)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _hasChecked 
                      ? (_isCorrect ? AppTheme.successGreen : AppTheme.glassSurface) 
                      : AppTheme.neonCyan,
                  foregroundColor: _hasChecked && !_isCorrect ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _selectedOptionIndex == -1 
                    ? null 
                    : (_hasChecked 
                        ? _nextQuestion 
                        : _checkAnswer),
                child: Text(
                  _hasChecked 
                      ? (_currentQuestionIndex == _quizQuestions.length - 1 ? 'Imtihonni yakunlash' : 'Keyingi savol') 
                      : 'Tekshirish',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _hasChecked && !_isCorrect ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
