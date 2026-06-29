import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/data/lessons_data.dart';
import 'package:python_darslari/screens/lesson_reader_screen.dart';
import 'package:python_darslari/theme/theme.dart';

class LessonsListScreen extends StatelessWidget {
  const LessonsListScreen({super.key});

  String _getSectionName(int lessonNumber) {
    if (lessonNumber <= 11) return 'Python Asoslari';
    if (lessonNumber <= 14) return 'Ma\'lumotlar Tuzilmalari';
    if (lessonNumber <= 18) return 'Funksiyalar va Xatolar';
    if (lessonNumber <= 23) return 'OOP (Obyektga Yo\'naltirilgan Dasturlash)';
    return 'Kutubxonalar, Test va Botlar';
  }

  Color _getSectionColor(int lessonNumber) {
    if (lessonNumber <= 11) return AppTheme.neonCyan;
    if (lessonNumber <= 14) return Colors.amber;
    if (lessonNumber <= 18) return AppTheme.neonBlue;
    if (lessonNumber <= 23) return AppTheme.neonPurple;
    return AppTheme.neonGreen;
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);

    // Group lessons by sections
    final Map<String, List<Lesson>> sections = {};
    for (var lesson in pythonLessons) {
      final secName = _getSectionName(lesson.lessonNumber);
      sections.putIfAbsent(secName, () => []).add(lesson);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Darsliklari'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: sections.keys.length,
        itemBuilder: (context, sectionIdx) {
          final sectionName = sections.keys.elementAt(sectionIdx);
          final sectionLessons = sections[sectionName]!;
          final sectionColor = _getSectionColor(sectionLessons.first.lessonNumber);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 12, left: 4),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      decoration: BoxDecoration(
                        color: sectionColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      sectionName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: sectionColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              // Lesson list in this section
              ...sectionLessons.map((lesson) {
                final isCompleted = state.isLessonCompleted(lesson.lessonNumber);
                final isQuizDone = state.isQuizCompleted(lesson.lessonNumber);
                
                // Unlocked logic: First 5 lessons are always unlocked, others if previous block exam is completed (passed with 80%+)
                final int requiredExamNumber = (lesson.lessonNumber - 1) ~/ 5;
                final isUnlocked = (requiredExamNumber == 0) || 
                                   state.isQuizCompleted(requiredExamNumber);

                return Opacity(
                  opacity: isUnlocked ? 1.0 : 0.55,
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                    'Ushbu dars qulflangan! Avvalgi blok imtihonidan o\'ting.',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          return;
                        }

                        // Save current progress indicator
                        state.saveCurrentLesson(lesson.lessonNumber);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonReaderScreen(lesson: lesson),
                          ),
                        );
                      },
                      leading: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: isUnlocked 
                              ? sectionColor.withOpacity(0.1) 
                              : Colors.white.withOpacity(0.04),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isUnlocked 
                                ? sectionColor.withOpacity(0.3) 
                                : Colors.white.withOpacity(0.08),
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${lesson.lessonNumber}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isUnlocked ? sectionColor : AppTheme.textMuted,
                          ),
                        ),
                      ),
                      title: Text(
                        lesson.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            // Read Status tag
                            _buildStatusTag(
                              isCompleted ? 'O\'qildi' : 'O\'qilmagan',
                              isCompleted ? AppTheme.successGreen : AppTheme.textMuted,
                              isCompleted ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
                            ),
                            const SizedBox(width: 8),
                            // Quiz Status tag
                            _buildStatusTag(
                              isQuizDone ? 'Test yechildi' : 'Test',
                              isQuizDone ? AppTheme.neonPurple : AppTheme.textMuted,
                              isQuizDone ? Icons.offline_bolt_rounded : Icons.help_outline_rounded,
                            ),
                          ],
                        ),
                      ),
                      trailing: Icon(
                        isUnlocked 
                            ? Icons.arrow_forward_ios_rounded 
                            : Icons.lock_outline_rounded,
                        color: isUnlocked ? AppTheme.textMuted : AppTheme.textMuted.withOpacity(0.5),
                        size: 16,
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatusTag(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
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
