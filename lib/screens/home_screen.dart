import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/data/lessons_data.dart';
import 'package:python_darslari/screens/lesson_reader_screen.dart';
import 'package:python_darslari/screens/console_screen.dart';
import 'package:python_darslari/screens/garage_screen.dart';
import 'package:python_darslari/screens/leaderboard_screen.dart';
import 'package:python_darslari/services/firebase_service.dart';
import 'package:python_darslari/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Time-based greetings for personalization
  String _getTimeGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Xayrli tong,';
    } else if (hour >= 12 && hour < 18) {
      return 'Xayrli kun,';
    } else if (hour >= 18 && hour < 24) {
      return 'Xayrli kech,';
    } else {
      return 'Tungi kodlash,';
    }
  }

  // Gaming tier names based on player level
  String _getLevelTier(int level) {
    if (level <= 2) return 'Python Boshlovchi';
    if (level <= 5) return 'Python Ishqibozi';
    if (level <= 10) return 'Dastur Ustasi';
    if (level <= 15) return 'Algoritm Qiroli';
    return 'Senior Python Dasturchi';
  }

  // Custom gaming stats for each car key
  Map<String, double> _getCarStats(String key) {
    switch (key) {
      case 'jiguli': return {'Tezlik': 0.15, 'Tezlanish': 0.12, 'Boshqaruv': 0.20};
      case 'damas': return {'Tezlik': 0.22, 'Tezlanish': 0.18, 'Boshqaruv': 0.32};
      case 'matiz': return {'Tezlik': 0.35, 'Tezlanish': 0.30, 'Boshqaruv': 0.45};
      case 'gentra': return {'Tezlik': 0.52, 'Tezlanish': 0.48, 'Boshqaruv': 0.58};
      case 'cobalt': return {'Tezlik': 0.48, 'Tezlanish': 0.45, 'Boshqaruv': 0.52};
      case 'malibu': return {'Tezlik': 0.70, 'Tezlanish': 0.68, 'Boshqaruv': 0.72};
      case 'tesla': return {'Tezlik': 0.88, 'Tezlanish': 0.98, 'Boshqaruv': 0.90};
      case 'bmw': return {'Tezlik': 0.95, 'Tezlanish': 0.94, 'Boshqaruv': 0.88};
      case 'mers': return {'Tezlik': 0.92, 'Tezlanish': 0.90, 'Boshqaruv': 0.96};
      case 'gelik': return {'Tezlik': 0.86, 'Tezlanish': 0.80, 'Boshqaruv': 0.76};
      case 'lambo': return {'Tezlik': 0.98, 'Tezlanish': 0.99, 'Boshqaruv': 0.92};
      case 'ferrari': return {'Tezlik': 0.99, 'Tezlanish': 0.98, 'Boshqaruv': 0.97};
      default: return {'Tezlik': 0.30, 'Tezlanish': 0.30, 'Boshqaruv': 0.30};
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final totalLessons = pythonLessons.length;
    final completedCount = state.completedLessons.length;
    final completionRate = totalLessons > 0 ? completedCount / totalLessons : 0.0;
    
    // Find current lesson
    final currentLesson = pythonLessons.firstWhere(
      (l) => l.lessonNumber == state.currentLessonNumber,
      orElse: () => pythonLessons.first,
    );

    final xpInCurrentLevel = state.xp % 100;
    final nextLevelXPNeeded = 100 - xpInCurrentLevel;
    final levelProgress = xpInCurrentLevel / 100.0;

    return Scaffold(
      body: Stack(
        children: [
          // Background glowing ambient lights
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.neonCyan.withOpacity(0.06),
                    blurRadius: 100,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 250,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.neonPurple.withOpacity(0.04),
                    blurRadius: 110,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                // 1. Dynamic Gamer Profile Header Zone
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Animated profile level badge
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppTheme.primaryGradient,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.neonCyan.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${state.level}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getTimeGreeting(),
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              state.userName.isNotEmpty ? state.userName : 'Bo\'lajak Senior!',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    // Glassmorphic XP Badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: AppTheme.glassDecoration(
                        borderRadius: 16,
                        color: AppTheme.glassSurface,
                        opacity: 0.8,
                        hasGlow: true,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.offline_bolt_rounded, color: AppTheme.neonCyan, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '${state.xp}',
                            style: const TextStyle(
                              color: AppTheme.neonCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'XP',
                            style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 2. RPG Level Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: AppTheme.glassDecoration(
                    opacity: 0.95,
                    borderRadius: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getLevelTier(state.level).toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.neonCyan,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Lvl ${state.level} Darajasi',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+$nextLevelXPNeeded XP keyingisiga',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      
                      // Progress Bar with custom indicator
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Container(
                              height: 8,
                              color: Colors.white.withOpacity(0.06),
                            ),
                            FractionallySizedBox(
                              widthFactor: levelProgress,
                              child: Container(
                                height: 8,
                                decoration: const BoxDecoration(
                                  gradient: AppTheme.accentGradient,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.neonPurple,
                                      blurRadius: 4,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Interactive Showroom Garage Showcase Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: AppTheme.glassDecoration(
                    opacity: 0.9,
                    borderRadius: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.directions_car_rounded, color: AppTheme.neonPurple, size: 16),
                              const SizedBox(width: 6),
                              const Text(
                                "FAOL MASHINA SHOWROOM",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textSecondary,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          // Coins pill indicator
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.neonAmber.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.neonAmber.withOpacity(0.2)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.stars_rounded, color: AppTheme.neonAmber, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  "${state.coins} T",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                    color: AppTheme.neonAmber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          // Left side: stats showing VAZ, Matiz, etc.
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getCarName(state.activeCarKey),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                
                                // Real stats bars based on car model
                                ..._getCarStats(state.activeCarKey).entries.map((entry) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              entry.key,
                                              style: const TextStyle(fontSize: 10, color: AppTheme.textMuted, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${(entry.value * 100).toInt()}%',
                                              style: TextStyle(fontSize: 10, color: _getCarColor(state.activeCarKey), fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: Stack(
                                            children: [
                                              Container(height: 4, color: Colors.white.withOpacity(0.05)),
                                              FractionallySizedBox(
                                                widthFactor: entry.value,
                                                child: Container(
                                                  height: 4,
                                                  color: _getCarColor(state.activeCarKey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Right side: Showcase platform and car 3D image
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    // 3D platform glow
                                    Container(
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: _getCarColor(state.activeCarKey).withOpacity(0.4),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                    // Platform line
                                    Container(
                                      width: 90,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                          color: _getCarColor(state.activeCarKey).withOpacity(0.6),
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                    // Car Image
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0),
                                      child: Image.asset(
                                        'assets/images/${state.activeCarKey}.png',
                                        height: 76,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.directions_car_filled_rounded,
                                            color: _getCarColor(state.activeCarKey),
                                            size: 64,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Garage action link
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GarageScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.garage_rounded, color: _getCarColor(state.activeCarKey), size: 16),
                              const SizedBox(width: 8),
                              const Text(
                                "Mening Garajim & Mashinalar Do'koni",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.keyboard_arrow_right_rounded, color: AppTheme.textMuted, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 4. Combined Learning Path Progress & Continuation Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: AppTheme.glassDecoration(
                    opacity: 0.95,
                    borderRadius: 24,
                  ),
                  child: Row(
                    children: [
                      // Radial Progress Ring
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.neonCyan.withOpacity(0.03),
                            ),
                          ),
                          SizedBox(
                            width: 74,
                            height: 74,
                            child: CircularProgressIndicator(
                              value: completionRate,
                              strokeWidth: 8,
                              backgroundColor: Colors.white.withOpacity(0.05),
                              color: AppTheme.neonCyan,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${(completionRate * 100).toInt()}%',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const Text(
                                'rivoj',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),

                      // Continue Reading Panel
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'JORIY TOPSHIRIQ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.neonPurple,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${currentLesson.lessonNumber}-dars: ${currentLesson.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Quick Action Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LessonReaderScreen(lesson: currentLesson),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: AppTheme.primaryGradient,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.neonCyan.withOpacity(0.2),
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'O\'qishni davom ettirish',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(Icons.play_arrow_rounded, color: Colors.black, size: 14),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 5. Grid for Quick Launch Actions (Terminal & Leaderboard)
                Row(
                  children: [
                    // Terminal card (Electric Cyan)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ConsoleScreen()),
                          );
                        },
                        child: Container(
                          height: 130,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppTheme.neonCyan.withOpacity(0.3), width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.neonCyan.withOpacity(0.06),
                                blurRadius: 10,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppTheme.neonCyan.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.terminal_rounded, color: AppTheme.neonCyan, size: 22),
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Terminal',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Kodni sinab ko\'ring',
                                    style: TextStyle(fontSize: 10, color: AppTheme.textSecondary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Leaderboard card (Neon Purple & Gold)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                          );
                        },
                        child: Container(
                          height: 130,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1A0F2E), Color(0xFF0F172A)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppTheme.neonPurple.withOpacity(0.3), width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.neonPurple.withOpacity(0.06),
                                blurRadius: 10,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppTheme.neonPurple.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.emoji_events_rounded, color: AppTheme.neonPurple, size: 22),
                                  ),
                                  // Live indicator
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: FirebaseService().isLoggedIn ? AppTheme.neonGreen : AppTheme.errorRed,
                                      boxShadow: [
                                        BoxShadow(
                                          color: (FirebaseService().isLoggedIn ? AppTheme.neonGreen : AppTheme.errorRed).withOpacity(0.4),
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reytinglar',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Dunyo bilan bellashing',
                                    style: TextStyle(fontSize: 10, color: AppTheme.textSecondary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // 6. Section Title: Detailed Stats
                const Padding(
                  padding: EdgeInsets.only(left: 4.0, bottom: 12.0),
                  child: Text(
                    'Kurs Ma\'lumotlari',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),

                // Grid stats details
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.5,
                  children: [
                    _buildStatCard(
                      context,
                      'O\'qilgan darslar',
                      '$completedCount / $totalLessons',
                      Icons.menu_book_rounded,
                      AppTheme.neonCyan,
                    ),
                    _buildStatCard(
                      context,
                      'Yechilgan testlar',
                      '${state.completedQuizzes.length} / 8',
                      Icons.offline_bolt_rounded,
                      AppTheme.neonPurple,
                    ),
                    _buildStatCard(
                      context,
                      'Bookmarklar',
                      '${state.bookmarkedLessons.length} ta',
                      Icons.bookmark_rounded,
                      AppTheme.neonBlue,
                    ),
                    _buildStatCard(
                      context,
                      'Jami Tajriba (XP)',
                      '${state.xp} XP',
                      Icons.workspace_premium_rounded,
                      Colors.amber,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.glassDecoration(
        opacity: 0.9,
        borderRadius: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 14),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

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
