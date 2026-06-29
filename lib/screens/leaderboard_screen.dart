import 'package:flutter/material.dart';
import 'package:python_darslari/services/firebase_service.dart';
import 'package:python_darslari/theme/theme.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final FirebaseService _firebase = FirebaseService();

  @override
  Widget build(BuildContext context) {
    final myUid = _firebase.uid;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.spaceBlack, Color(0xFF0F0B24)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "🏆 Jonli Reytinglar",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.neonCyan.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.neonCyan.withOpacity(0.2)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.sync_rounded, color: AppTheme.neonCyan, size: 12),
                          SizedBox(width: 4),
                          Text(
                            "REALTIME",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.neonCyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Realtime Stream Builder
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _firebase.getLeaderboard(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Ulanishda xatolik: ${snapshot.error}",
                          style: const TextStyle(color: AppTheme.errorRed),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: AppTheme.neonCyan),
                      );
                    }

                    final List<Map<String, dynamic>> players = snapshot.data ?? [];


                    if (players.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.leaderboard_rounded, color: AppTheme.textMuted, size: 64),
                            SizedBox(height: 16),
                            Text(
                              "Hali hech kim yo'q",
                              style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Dars o'qib XP yig'ing va birinchi bo'ling!",
                              style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    }

                    return Column(
                      children: [
                        // Podium for Top 3 (if we have at least 3 players)
                        if (players.length >= 3) _buildPodium(players),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                "Barcha O'yinchilar",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "O'quvchilar progressi",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppTheme.textMuted,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Players List
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            itemCount: players.length,
                            itemBuilder: (context, index) {
                              final player = players[index];
                              final bool isMe = player['uid'] == myUid;
                              final int rank = index + 1;
                              final int xp = player['xp'] ?? 0;
                              final int level = player['level'] ?? 1;
                              final String name = player['name'] ?? 'O\'yinchi';

                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? AppTheme.neonCyan.withOpacity(0.08)
                                      : AppTheme.glassSurface,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: isMe
                                        ? AppTheme.neonCyan.withOpacity(0.4)
                                        : AppTheme.glassBorder,
                                    width: isMe ? 1.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Rank
                                    SizedBox(
                                      width: 44,
                                      child: Text(
                                        _getRankEmoji(rank),
                                        style: TextStyle(
                                          fontSize: rank <= 3 ? 20 : 14,
                                          fontWeight: FontWeight.bold,
                                          color: rank <= 3 ? Colors.white : AppTheme.textMuted,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),

                                    // Player info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: isMe ? AppTheme.neonCyan : Colors.white,
                                                ),
                                              ),
                                              if (isMe) ...[
                                                const SizedBox(width: 6),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.neonCyan.withOpacity(0.2),
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  child: const Text(
                                                    "SIZ",
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppTheme.neonCyan,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "Lvl $level",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: AppTheme.textMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // XP
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _getRankColor(rank).withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _getRankColor(rank).withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        '$xp XP',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: _getRankColor(rank),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodium(List<Map<String, dynamic>> players) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 2nd place
          _buildPodiumItem(players[1], 2, 90),
          // 1st place
          _buildPodiumItem(players[0], 1, 120),
          // 3rd place
          _buildPodiumItem(players[2], 3, 70),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(Map<String, dynamic> player, int rank, double height) {
    final bool isMe = player['uid'] == _firebase.uid;
    final Color rankColor = _getRankColor(rank);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _getRankEmoji(rank),
          style: const TextStyle(fontSize: 26),
        ),
        const SizedBox(height: 4),
        Text(
          player['name'] ?? 'O\'yinchi',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isMe ? AppTheme.neonCyan : Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          '${player['xp'] ?? 0} XP',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: rankColor,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 76,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                rankColor.withOpacity(0.35),
                rankColor.withOpacity(0.08),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(color: rankColor.withOpacity(0.4), width: 1.5),
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: rankColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getRankEmoji(int rank) {
    switch (rank) {
      case 1: return '👑'; // Winner Gold Crown
      case 2: return '🥈👑'; // Silver Crown
      case 3: return '🥉👑'; // Bronze Crown
      default: return '#$rank';
    }
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1: return const Color(0xFFFFD700); // Gold
      case 2: return const Color(0xFFC0C0C0); // Silver
      case 3: return const Color(0xFFCD7F32); // Bronze
      default: return AppTheme.neonCyan;
    }
  }
}
