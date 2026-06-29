import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/data/lessons_data.dart';
import 'package:python_darslari/screens/quiz_screen.dart';
import 'package:python_darslari/theme/theme.dart';

class QuizzesListScreen extends StatelessWidget {
  const QuizzesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);

    // There are 8 cumulative exams, each covering 5 lessons
    const totalExams = 8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Imtihonlari'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: totalExams,
        itemBuilder: (context, idx) {
          final examNumber = idx + 1;
          final startLesson = (examNumber - 1) * 5 + 1;
          final endLesson = examNumber * 5;

          // Get lessons for this block
          final blockLessons = pythonLessons
              .where((l) => l.lessonNumber >= startLesson && l.lessonNumber <= endLesson)
              .toList();

          final bool isQuizDone = state.isQuizCompleted(examNumber);
          
          // Exam is unlocked if it's Exam 1 OR the previous block exam is completed
          final bool isUnlocked = (examNumber == 1) || state.isQuizCompleted(examNumber - 1);

          // All 5 lessons in this block must be read/completed
          final bool allLessonsRead = blockLessons.every((l) => state.isLessonCompleted(l.lessonNumber));

          Color statusColor = AppTheme.neonCyan;
          if (isQuizDone) {
            statusColor = AppTheme.successGreen;
          } else if (!isUnlocked) {
            statusColor = AppTheme.errorRed;
          } else if (!allLessonsRead) {
            statusColor = AppTheme.neonPurple;
          }

          return Opacity(
            opacity: isUnlocked ? 1.0 : 0.55,
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: isUnlocked 
                      ? statusColor.withOpacity(0.3) 
                      : Colors.white.withOpacity(0.05),
                  width: 1.5,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                onTap: () {
                  if (!isUnlocked) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppTheme.glassSurface,
                        content: Row(
                          children: [
                            const Icon(Icons.lock_rounded, color: AppTheme.neonPurple),
                            const SizedBox(width: 12),
                            Text(
                              'Avvalgi imtihondan o\'ting (kamida 80% to\'g\'ri).',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    return;
                  }

                  if (!allLessonsRead) {
                    // Find which lessons are not read yet
                    final unread = blockLessons
                        .where((l) => !state.isLessonCompleted(l.lessonNumber))
                        .map((l) => '${l.lessonNumber}')
                        .join(', ');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppTheme.glassSurface,
                        content: Row(
                          children: [
                            const Icon(Icons.menu_book_rounded, color: AppTheme.neonCyan),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Imtihondan oldin $startLesson-$endLesson darslarni o\'qing! Yozilmagan darslar: $unread',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        examNumber: examNumber,
                        blockLessons: blockLessons,
                      ),
                    ),
                  );
                },
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isUnlocked 
                        ? statusColor.withOpacity(0.1) 
                        : Colors.white.withOpacity(0.04),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isUnlocked 
                          ? statusColor.withOpacity(0.3) 
                          : Colors.white.withOpacity(0.08),
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    isQuizDone 
                        ? Icons.emoji_events_rounded 
                        : (isUnlocked ? Icons.quiz_rounded : Icons.lock_outline_rounded),
                    color: isQuizDone 
                        ? AppTheme.neonAmber 
                        : (isUnlocked ? statusColor : AppTheme.textMuted),
                    size: 22,
                  ),
                ),
                title: Text(
                  '$examNumber-Imtihon ($startLesson-$endLesson darslar)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      // Status tag
                      _buildStatusTag(
                        isQuizDone 
                            ? 'Muvaffaqiyatli' 
                            : (isUnlocked 
                                ? (allLessonsRead ? 'Tayyor' : 'O\'qilmagan darslar bor') 
                                : 'Qulflangan'),
                        isQuizDone 
                            ? AppTheme.successGreen 
                            : (isUnlocked 
                                ? (allLessonsRead ? AppTheme.neonCyan : AppTheme.neonPurple) 
                                : AppTheme.errorRed),
                        isQuizDone 
                            ? Icons.verified_rounded 
                            : (isUnlocked 
                                ? (allLessonsRead ? Icons.play_arrow_rounded : Icons.menu_book_rounded) 
                                : Icons.lock_rounded),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '50 ta savol',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.textMuted.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(
                  isUnlocked 
                      ? Icons.arrow_forward_ios_rounded 
                      : Icons.lock_outline_rounded,
                  color: isUnlocked ? AppTheme.textMuted : AppTheme.textMuted.withOpacity(0.4),
                  size: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusTag(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.25), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
