import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/data/lessons_data.dart';
import 'package:python_darslari/screens/quizzes_list_screen.dart';
import 'package:python_darslari/screens/console_screen.dart';
import 'package:python_darslari/theme/theme.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class LessonReaderScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonReaderScreen({super.key, required this.lesson});

  @override
  State<LessonReaderScreen> createState() => _LessonReaderScreenState();
}

class _LessonReaderScreenState extends State<LessonReaderScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
    
    // Automatically mark lesson as completed when they open it, to unlock next lesson
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final state = AppStateProvider.of(context, listen: false);
        state.markLessonCompleted(widget.lesson.lessonNumber);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollProgress() {
    if (!mounted) return;
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    setState(() {
      _scrollProgress = maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final isBookmarked = state.isBookmarked(widget.lesson.lessonNumber);


    return Scaffold(
      body: Stack(
        children: [
          // Background Glow elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.neonCyan.withOpacity(0.06),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.neonPurple.withOpacity(0.04),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // CustomScrollView - Senior standard (No NestedScrollView + SingleChildScrollView issues)
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text('${widget.lesson.lessonNumber}-dars'),
                actions: [
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isBookmarked ? AppTheme.neonCyan : Colors.white,
                    ),
                    onPressed: () {
                      state.toggleBookmark(widget.lesson.lessonNumber);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          backgroundColor: AppTheme.glassSurface,
                          content: Text(
                            isBookmarked 
                                ? 'Bookmarklardan olib tashlandi' 
                                : 'Bookmarklarga saqlandi!',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Lesson Title
                    Text(
                      widget.lesson.title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Section Tag
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.neonCyan.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppTheme.neonCyan.withOpacity(0.2)),
                        ),
                        child: const Text(
                          'PYTHON DARSLIGI',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.neonCyan,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Markdown Content with Custom Code Builders
                    MarkdownBody(
                      data: _preprocessMarkdown(widget.lesson.introduction),
                      selectable: true,
                      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                        p: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.textSecondary,
                              height: 1.6,
                            ),
                        h1: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                              height: 2.0,
                            ),
                        h2: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                            ),
                        h3: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.bold,
                              height: 1.6,
                            ),
                        code: const TextStyle(
                          fontFamily: 'monospace',
                          backgroundColor: Colors.transparent,
                          color: AppTheme.neonCyan,
                        ),
                        codeblockDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      builders: {
                        'code': CodeElementBuilder(context, (code) {
                          if (code.trim().startsWith('>>>')) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: _buildOutputView(code.trim()),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _buildCodeSnippet(code.trim()),
                          );
                        }),
                      },
                    ),

                    // Vocabulary list inside lesson if it exists
                    if (widget.lesson.vocabularyRaw.isNotEmpty) ...[
                      const SizedBox(height: 25),
                      const Divider(color: AppTheme.glassBorder),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Icon(Icons.translate_rounded, color: AppTheme.neonPurple, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Dars Lug\'ati',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _buildVocabularyCard(widget.lesson.vocabularyRaw),
                    ],
                  ]),
                ),
              ),
            ],
          ),

          // Scroll progress indicator
          Positioned(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            left: 0,
            right: 0,
            child: Container(
              height: 3,
              alignment: Alignment.centerLeft,
              color: Colors.white.withOpacity(0.05),
              child: FractionallySizedBox(
                widthFactor: _scrollProgress,
                child: Container(
                  height: 3,
                  color: AppTheme.neonCyan,
                ),
              ),
            ),
          ),

          // Floating Action Bar at the bottom
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: widget.lesson.exercises.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.neonCyan.withOpacity(0.12),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizzesListScreen(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.offline_bolt_rounded, color: Colors.black, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Mashqlarni Boshlash (+50 XP)',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  bool _isCodeBlock(String text) {
    // Check if block contains common coding syntax
    final checkPatterns = [
      r'^print\(', r'^ism =', r'^yosh =', r'^son =', r'^rang =', r'^meva =',
      r'^with open\(', r'^def ', r'^class ', r'^import ', r'^from ',
      r'^lambda ', r'^Juftyokitoq =', r'^t = \(', r'^s = \{',
      r'^\w+\s*=\s*input\(', r'^\w+\.write\(', r'^\w+\.read\(',
      r'^f\.write\(', r'^f\.read\(', r'^with\s+open',
      r'^karta\s*=\s*Hisob\(', r'^moshinam\s*=', r'^tel\s*='
    ];
    
    final lines = text.split('\n');
    for (var pattern in checkPatterns) {
      if (RegExp(pattern, caseSensitive: false).hasMatch(lines.first.trim())) {
        return true;
      }
    }
    return false;
  }

  Widget _buildCodeSnippet(String code) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0F1B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.glassBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar of snippet
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF131625),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
                    const SizedBox(width: 5),
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                    const SizedBox(width: 5),
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                    const SizedBox(width: 10),
                    const Text(
                      'python_example.py',
                      style: TextStyle(fontSize: 11, color: AppTheme.textSecondary, fontFamily: 'monospace'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Copy button
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: code));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 600),
                            content: Text('Kod buferga nusxalandi!'),
                          ),
                        );
                      },
                      child: const Icon(Icons.copy_rounded, color: AppTheme.textMuted, size: 14),
                    ),
                    const SizedBox(width: 12),
                    // Play code in console button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsoleScreen(preloadedCode: code),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.play_arrow_rounded, color: AppTheme.neonCyan, size: 16),
                          SizedBox(width: 2),
                          Text(
                            'Run',
                            style: TextStyle(fontSize: 11, color: AppTheme.neonCyan, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Code display block
          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  height: 1.5,
                ),
                children: _highlightPythonCode(code),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutputView(String output) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.04), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LOG: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.textMuted,
              fontFamily: 'monospace',
            ),
          ),
          Expanded(
            child: Text(
              output.replaceAll('>>>', '').trim(),
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFFE2E8F0),
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVocabularyCard(String vocabText) {
    final List<String> lines = vocabText.split('\n');
    final List<Widget> items = [];

    // Simple line-based layout render
    for (var line in lines) {
      final t = line.trim();
      if (t.isEmpty || t.toLowerCase() == 'lughati' || t.toLowerCase() == 'kodlar lug\'ati') continue;
      
      // If it looks like a header table column name, skip
      if (t == 'Kod' || t == 'Ma\'nosi' || t == 'Misol') continue;

      items.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            t,
            style: TextStyle(
              fontSize: 14,
              fontFamily: t.contains('()') || t.contains('=') || t.startsWith('#') || t.contains('"') ? 'monospace' : 'inter',
              color: t.contains('()') || t.contains('=') || t.contains('"') ? AppTheme.neonCyan : AppTheme.textSecondary,
              fontWeight: t.contains('()') || t.contains('=') ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.glassDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }

  List<TextSpan> _highlightPythonCode(String code) {
    final List<TextSpan> spans = [];
    
    // Regular expression for simple Python syntax tokens
    final tokenPattern = RegExp(
      r'(#.*)|'
      r'("(?:\\.|[^"\\])*"|\x27(?:\\.|[^\x27\\])*\x27)|'
      r'(\b\d+\.?\d*\b)|'
      r'(\b(?:print|def|class|import|from|with|as|try|except|finally|in|for|while|lambda|int|float|str|len|type|return|if|else|elif|pass|None|True|False|and|or|not)\b)|'
      r'([a-zA-Z_][a-zA-Z0-9_]*)|'
      r'([^\s\w])',
      multiLine: true,
    );

    int lastMatchEnd = 0;
    
    for (final match in tokenPattern.allMatches(code)) {
      // Add text before the match
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: code.substring(lastMatchEnd, match.start)));
      }

      final text = match.group(0)!;

      if (match.group(1) != null) {
        // Comment
        spans.add(TextSpan(text: text, style: const TextStyle(color: AppTheme.textMuted)));
      } else if (match.group(2) != null) {
        // String
        spans.add(TextSpan(text: text, style: const TextStyle(color: AppTheme.successGreen)));
      } else if (match.group(3) != null) {
        // Number
        spans.add(TextSpan(text: text, style: const TextStyle(color: Colors.amber)));
      } else if (match.group(4) != null) {
        // Keyword
        spans.add(TextSpan(text: text, style: const TextStyle(color: Color(0xFFFFA726), fontWeight: FontWeight.bold)));
      } else if (match.group(5) != null) {
        // Identifier
        spans.add(TextSpan(text: text, style: const TextStyle(color: AppTheme.textPrimary)));
      } else {
        // Symbols
        spans.add(TextSpan(text: text, style: const TextStyle(color: Color(0xFF80DEEA))));
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < code.length) {
      spans.add(TextSpan(text: code.substring(lastMatchEnd)));
    }

    return spans;
  }
}

// Custom Markdown Element Builder for Python Code snippets
class CodeElementBuilder extends MarkdownElementBuilder {
  final BuildContext context;
  final Widget Function(String code) buildCodeBlock;

  CodeElementBuilder(this.context, this.buildCodeBlock);

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final String text = element.textContent;
    // Fenced code blocks contain newlines or have a CSS class (like language-python)
    final bool isBlock = text.contains('\n') || (element.attributes['class'] ?? '').contains('language-');
    if (isBlock) {
      return buildCodeBlock(text);
    }
    return null; // Return null to fallback to default inline code rendering (prevents _inlines.isEmpty assertion crashes)
  }
}

// Preprocessor to replace relative image URLs with absolute ones from python.sariq.dev
String _preprocessMarkdown(String text) {
  var processed = text.replaceAll('](/files/', '](https://python.sariq.dev/files/');
  processed = processed.replaceAll('src="/files/', 'src="https://python.sariq.dev/files/');
  return processed;
}
