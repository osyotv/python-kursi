import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/home_screen.dart';
import 'package:python_darslari/screens/lessons_list_screen.dart';
import 'package:python_darslari/screens/quizzes_list_screen.dart';
import 'package:python_darslari/screens/vocabulary_screen.dart';
import 'package:python_darslari/screens/games_screen.dart';
import 'package:python_darslari/screens/registration_screen.dart';
import 'package:python_darslari/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final appState = AppState();
  await appState.init();
  
  runApp(
    AppStateProvider(
      notifier: appState,
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Kursi',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final state = AppStateProvider.of(context);
          return state.isRegistered ? const MainNavigationFrame() : const RegistrationScreen();
        },
      ),
    );
  }
}

class MainNavigationFrame extends StatefulWidget {
  const MainNavigationFrame({super.key});

  @override
  State<MainNavigationFrame> createState() => _MainNavigationFrameState();
}

class _MainNavigationFrameState extends State<MainNavigationFrame> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    LessonsListScreen(),
    GamesScreen(),
    QuizzesListScreen(),
    VocabularyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16), // Floating premium look
        decoration: AppTheme.glassDecoration(
          borderRadius: 24,
          opacity: 0.95,
          hasGlow: true,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCustomNavItem(0, Icons.explore_rounded, 'Bosh sahifa', AppTheme.neonCyan),
            _buildCustomNavItem(1, Icons.menu_book_rounded, 'Darslar', AppTheme.neonBlue),
            _buildCustomNavItem(2, Icons.sports_esports_rounded, 'O\'yinlar', AppTheme.neonPurple),
            _buildCustomNavItem(3, Icons.rocket_launch_rounded, 'Testlar', AppTheme.neonAmber),
            _buildCustomNavItem(4, Icons.psychology_rounded, 'Lug\'at', AppTheme.neonGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomNavItem(int index, IconData icon, String label, Color activeColor) {
    final bool isSelected = _currentIndex == index;
    // Premium glassmorphic style: unselected tabs are soft white-grey, selected are vibrant neon
    final Color color = isSelected ? activeColor : Colors.white.withOpacity(0.5);

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Glowing circular aura container around selected icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              padding: EdgeInsets.all(isSelected ? 8 : 4),
              decoration: BoxDecoration(
                color: isSelected ? activeColor.withOpacity(0.08) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? activeColor.withOpacity(0.2) : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? activeColor.withOpacity(0.12) : Colors.transparent,
                    blurRadius: isSelected ? 12 : 0,
                    spreadRadius: isSelected ? 1 : 0,
                  )
                ],
              ),
              child: Icon(
                icon,
                color: color,
                size: isSelected ? 24 : 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: color,
                letterSpacing: isSelected ? 0.3 : 0.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
