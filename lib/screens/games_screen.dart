import 'package:flutter/material.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/game_airplane.dart';
import 'package:python_darslari/screens/game_snake.dart';
import 'package:python_darslari/screens/game_car.dart';
import 'package:python_darslari/screens/multiplayer_lobby_screen.dart';
import 'package:python_darslari/theme/theme.dart';

class GameQuestion {
  final String code;
  final String answer;
  final List<String> choices;

  const GameQuestion({
    required this.code,
    required this.answer,
    required this.choices,
  });
}

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  // Global question bank covering beginner to advanced python concepts
  static const List<GameQuestion> questionBank = [
    GameQuestion(
      code: "print('Salom')",
      answer: "Konsolga matn chiqarish",
      choices: ["Konsolga matn chiqarish", "Foydalanuvchidan ma'lumot olish", "Kodni takrorlash"],
    ),
    GameQuestion(
      code: "input('Ismingiz?')",
      answer: "Foydalanuvchidan ma'lumot olish",
      choices: ["Foydalanuvchidan ma'lumot olish", "Matnni chop etish", "Lug'at yaratish"],
    ),
    GameQuestion(
      code: "for i in range(5):",
      answer: "Siklni 5 marta aylantirish",
      choices: ["Siklni 5 marta aylantirish", "Cheksiz sikl yaratish", "Sinflarni e'lon qilish"],
    ),
    GameQuestion(
      code: "yosh = int('18')",
      answer: "Matnni butun songa o'tkazish",
      choices: ["Matnni butun songa o'tkazish", "Matn uzunligini aniqlash", "Haqiqiy sonni butun qilish"],
    ),
    GameQuestion(
      code: "sonlar = [1, 2, 3]",
      answer: "Ro'yxat (List) yaratish",
      choices: ["Ro'yxat (List) yaratish", "Lug'at (Dict) yaratish", "Korshed (Tuple) yaratish"],
    ),
    GameQuestion(
      code: "sonlar.append(4)",
      answer: "Ro'yxat oxiriga element qo'shish",
      choices: ["Ro'yxat oxiriga element qo'shish", "Ro'yxat boshidan o'chirish", "Ro'yxatni saralash"],
    ),
    GameQuestion(
      code: "len([10, 20, 30])",
      answer: "Ro'yxat elementlar sonini aniqlash",
      choices: ["Ro'yxat elementlar sonini aniqlash", "Eng katta elementni topish", "Elementlarni qo'shish"],
    ),
    GameQuestion(
      code: "max([3, 14, 5])",
      answer: "Ro'yxatdagi eng katta qiymatni topish",
      choices: ["Ro'yxatdagi eng katta qiymatni topish", "Eng kichik qiymatni topish", "O'rtacha qiymatni topish"],
    ),
    GameQuestion(
      code: "def salom_ber():",
      answer: "Funksiya e'lon qilish",
      choices: ["Funksiya e'lon qilish", "Klass e'lon qilish", "Modulni import qilish"],
    ),
    GameQuestion(
      code: "class Moshina:",
      answer: "Sinf (Class) yaratish",
      choices: ["Sinf (Class) yaratish", "Obyektni o'chirish", "Shart tekshirish"],
    ),
    GameQuestion(
      code: "import math",
      answer: "Matematika kutubxonasini yuklash",
      choices: ["Matematika kutubxonasini yuklash", "Tizim sozlamalarini yuklash", "Tasodifiy sonlar kutubxonasi"],
    ),
    GameQuestion(
      code: "try / except",
      answer: "Xatoliklarni ushlab qolish",
      choices: ["Xatoliklarni ushlab qolish", "Cheksiz aylanish", "Ma'lumotlar turini o'zgartirish"],
    ),
    GameQuestion(
      code: "yosh >= 18",
      answer: "Kattami yoki tengmi shartini tekshirish",
      choices: ["Kattami yoki tengmi shartini tekshirish", "Kichikmi shartini tekshirish", "Teng emasmi shartini tekshirish"],
    ),
    GameQuestion(
      code: "math.sqrt(25)",
      answer: "Sonning kvadrat ildizini topish",
      choices: ["Sonning kvadrat ildizini topish", "Sonning darajasini topish", "Sonning eng yaqin butunini topish"],
    ),
    GameQuestion(
      code: "x = lambda a : a + 10",
      answer: "Kichik anonim funksiya yaratish",
      choices: ["Kichik anonim funksiya yaratish", "Klass metodini yaratish", "Ro'yxatni filtrlash"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final currentXP = state.xp;
    final level = state.level;
    final xpForNextLevel = 100;
    final progressInLevel = (currentXP % 100) / xpForNextLevel;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.spaceBlack, AppTheme.darkGlow],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Duolingo-style Header Stats
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.neonPurple.withOpacity(0.2),
                      radius: 26,
                      child: Text(
                        '$level',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.neonPurple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Daraja $level",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${currentXP % 100} / 100 XP",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progressInLevel,
                              minHeight: 10,
                              backgroundColor: AppTheme.glassSurface,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.neonPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Dasturlash O'yinlari",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: Text(
                  "Kodlarni yodlash uchun interaktiv o'yinlarni o'ynang! Har bir muvaffaqiyatli o'yin (kamida 70% to'g'ri javob) 30 XP va Tanga beradi.",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Game Selections
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    _buildGameCard(
                      context,
                      title: "Samolyot (Space Jet)",
                      description: "Kosmik samolyotda uchib ketayotganda to'g'ri javob pufakchalarini to'plang va dushman to'siqlardan qoching!",
                      icon: Icons.flight_takeoff_rounded,
                      color: AppTheme.neonCyan,
                      screen: const GameAirplaneScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildGameCard(
                      context,
                      title: "Iloncha (Python Snake)",
                      description: "Ilonchani boshqarib, Python operatorlariga mos ta'rif ovqatlarini yeng!",
                      icon: Icons.gesture_rounded,
                      color: AppTheme.neonGreen,
                      screen: const GameSnakeScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildGameCard(
                      context,
                      title: "Poyga (Highway Race)",
                      description: "Tezlikda ketayotgan moshina bilan devorlarni teshib, faqat to'g'ri javobli yo'lakdan o'ting!",
                      icon: Icons.directions_car_filled_rounded,
                      color: AppTheme.neonAmber,
                      screen: const GameCarScreen(),
                      secondaryActionButton: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.neonPurple.withOpacity(0.15),
                          foregroundColor: AppTheme.neonPurple,
                          side: const BorderSide(color: AppTheme.neonPurple, width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        icon: const Icon(Icons.people_alt_rounded, size: 18),
                        label: const Text(
                          "Ko'p o'yinchi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MultiplayerLobbyScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Widget screen,
    Widget? secondaryActionButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.glassSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.15),
                  radius: 24,
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (secondaryActionButton != null) ...[
                  secondaryActionButton,
                  const SizedBox(width: 10),
                ],
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.withOpacity(0.2),
                    foregroundColor: color,
                    side: BorderSide(color: color.withOpacity(0.5), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(
                    "Boshlash",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
