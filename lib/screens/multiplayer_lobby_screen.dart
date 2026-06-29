import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:python_darslari/data/app_state.dart';
import 'package:python_darslari/screens/multiplayer_game_car.dart';
import 'package:python_darslari/services/firebase_service.dart';
import 'package:python_darslari/theme/theme.dart';

class MultiplayerLobbyScreen extends StatefulWidget {
  const MultiplayerLobbyScreen({super.key});

  @override
  State<MultiplayerLobbyScreen> createState() => _MultiplayerLobbyScreenState();
}

class _MultiplayerLobbyScreenState extends State<MultiplayerLobbyScreen> {
  final _roomController = TextEditingController(text: '777');
  final _nameController = TextEditingController(text: 'Poygachi');
  final FirebaseService _firebase = FirebaseService();
  
  bool _joined = false;
  String _roomId = '';
  String _myName = '';
  bool _isHost = false;
  
  List<Map<String, dynamic>> _lobbyPlayers = [];
  StreamSubscription<DocumentSnapshot>? _roomSubscription;

  @override
  void initState() {
    super.initState();
  }

  void _joinRoom() {
    if (_roomController.text.trim().isEmpty || _nameController.text.trim().isEmpty) {
      return;
    }
    if (!_firebase.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Firebase'ga ulanish kutilmoqda..."),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }
    
    final state = AppStateProvider.of(context, listen: false);
    
    setState(() {
      _roomId = _roomController.text.trim();
      _myName = _nameController.text.trim();
      _joined = true;
    });

    // Firestore'ga xonaga qo'shilish
    _firebase.joinRoom(
      roomId: _roomId,
      playerName: _myName,
      carKey: state.activeCarKey,
    );

    // 🔥 Real-time: Xonani va o'yinchilarni tinglash (bitta hujjatda)
    _roomSubscription = _firebase.roomStream(_roomId).listen((snapshot) {
      if (!mounted) return;
      
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        final String status = data['status'] ?? 'waiting';
        final String hostId = data['hostId'] ?? '';
        final Map<String, dynamic> playersMap = Map<String, dynamic>.from(data['players'] ?? {});
        
        final List<Map<String, dynamic>> players = [];
        playersMap.forEach((uid, val) {
          final player = Map<String, dynamic>.from(val as Map);
          player['uid'] = uid;
          players.add(player);
        });

        setState(() {
          _lobbyPlayers = players;
          _isHost = hostId == _firebase.uid;
        });

        // Agar o'yin boshlangan bo'lsa
        if (status == 'playing') {
          _enterRace();
        }
      }
    });
  }

  void _triggerStartGame() async {
    // Botlarni qo'shish (15 tagacha to'ldirish)
    final int botsToSeed = (15 - _lobbyPlayers.length).clamp(0, 14);
    
    final List<String> botNames = [
      'MatizDrifter', 'DamasUchar', "GelikXo'jayin", 'PythonCoder', 
      'MalibuTurbo', 'CobaltTaksi', 'NexiaQuruvchi', 'JiguliKlassik', 
      'TicoTezkor', 'TeslaAvtopilot', 'BugattiUz', 'MersSinf',
      "Bo'lajakSenior", 'KodUstasi',
    ];
    final List<String> carKeys = [
      'jiguli', 'damas', 'matiz', 'gentra', 'cobalt', 
      'malibu', 'tesla', 'bmw', 'mers', 'gelik', 'lambo', 'ferrari',
    ];

    if (botsToSeed > 0) {
      await _firebase.seedBots(
        roomId: _roomId,
        count: botsToSeed,
        botNames: botNames,
        carKeys: carKeys,
      );
    }

    // Xona statusini "playing" ga o'zgartirish
    await _firebase.updateRoomStatus(_roomId, 'playing');
    
    _enterRace();
  }

  void _enterRace() {
    _roomSubscription?.cancel();
    
    if (!mounted) return;
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MultiplayerGameCarScreen(
          roomId: _roomId,
          myName: _myName,
          mySessionId: _firebase.uid ?? 'unknown',
        ),
      ),
    );
  }

  void _leaveRoom() async {
    _roomSubscription?.cancel();
    
    if (_roomId.isNotEmpty) {
      await _firebase.leaveRoom(_roomId);
    }
    
    setState(() {
      _joined = false;
      _lobbyPlayers.clear();
      _isHost = false;
    });
  }

  @override
  void dispose() {
    _roomSubscription?.cancel();
    _roomController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              // Back / Exit Button Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: _joined ? _leaveRoom : () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _joined ? "🔥 Firestore Xona: $_roomId" : "Ko'p o'yinchi (Multiplayer)",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Firebase ulanish indikatori
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _firebase.isLoggedIn 
                            ? AppTheme.neonGreen.withOpacity(0.15)
                            : AppTheme.errorRed.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _firebase.isLoggedIn ? AppTheme.neonGreen : AppTheme.errorRed,
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _firebase.isLoggedIn ? Icons.cloud_done_rounded : Icons.cloud_off_rounded,
                            color: _firebase.isLoggedIn ? AppTheme.neonGreen : AppTheme.errorRed,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _firebase.isLoggedIn ? "LIVE" : "OFFLINE",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: _firebase.isLoggedIn ? AppTheme.neonGreen : AppTheme.errorRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: _joined ? _buildLobbyView() : _buildJoinForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJoinForm() {
    final state = AppStateProvider.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.glassSurface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.neonPurple.withOpacity(0.3), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppTheme.neonPurple.withOpacity(0.06),
                blurRadius: 20,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.hub_rounded, color: AppTheme.neonPurple, size: 68),
              const SizedBox(height: 12),
              const Text(
                "🔥 Firestore Real-time Poyga",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bir xil Xona ID kiriting, do'stlaringiz bilan turli qurilmalardan birga o'ynang! Cloud Firestore orqali real-time sinxronizatsiya.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4),
              ),
              const SizedBox(height: 20),

              // Room Input
              TextField(
                controller: _roomController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Xona ID (Room ID)',
                  labelStyle: const TextStyle(color: AppTheme.textSecondary),
                  prefixIcon: const Icon(Icons.meeting_room_rounded, color: AppTheme.neonPurple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.glassBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.neonPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Nickname Input
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ismingiz (Nickname)',
                  labelStyle: const TextStyle(color: AppTheme.textSecondary),
                  prefixIcon: const Icon(Icons.face_rounded, color: AppTheme.neonPurple),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.glassBorder),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.neonPurple),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Current Equipped Car info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.glassBorder),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/${state.activeCarKey}.png',
                      width: 44,
                      height: 44,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.directions_car_filled_rounded, color: AppTheme.neonPurple),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TANLANGAN MASHINA",
                            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.neonPurple),
                          ),
                          Text(
                            _getCarName(state.activeCarKey),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.neonPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    shadowColor: AppTheme.neonPurple.withOpacity(0.3),
                  ),
                  onPressed: _firebase.isLoggedIn ? _joinRoom : null,
                  child: Text(
                    _firebase.isLoggedIn 
                        ? "🔥 XONAGA ULANISH (JOIN ROOM)" 
                        : "Firebase'ga ulanish kutilmoqda...",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLobbyView() {
    final myUid = _firebase.uid;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lobby Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.glassSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.glassBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("🔥 REAL-TIME XONA", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.neonPurple)),
                    const SizedBox(height: 4),
                    Text(
                      "Ishtirokchilar: ${_lobbyPlayers.length} ta o'yinchi",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  _isHost ? "Siz Xostsiz (Host)" : "Kutilmoqda...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isHost ? AppTheme.neonGreen : AppTheme.neonAmber,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          const Text(
            "Real-time O'yinchilar (Firestore Live):",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 8),

          // Connected Players list
          Expanded(
            child: ListView.builder(
              itemCount: _lobbyPlayers.length,
              itemBuilder: (context, index) {
                final p = _lobbyPlayers[index];
                final bool isSelf = p['uid'] == myUid;
                final bool isBot = p['isBot'] == true;
                final String carName = _getCarName(p['car'] ?? 'jiguli');
                final String playerName = p['name'] ?? 'Poygachi';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  color: isSelf ? AppTheme.neonPurple.withOpacity(0.08) : AppTheme.glassSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      color: isSelf ? AppTheme.neonPurple : AppTheme.glassBorder,
                      width: isSelf ? 1.5 : 1.0,
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/${p['car'] ?? 'jiguli'}.png',
                      width: 44,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.directions_car_filled_rounded, color: Colors.white),
                    ),
                    title: Row(
                      children: [
                        Text(
                          playerName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelf ? AppTheme.neonPurple : Colors.white,
                          ),
                        ),
                        if (isSelf) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
                            decoration: BoxDecoration(color: AppTheme.neonCyan.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                            child: const Text("SIZ", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: AppTheme.neonCyan)),
                          ),
                        ],
                        if (_isHost && isSelf) ...[
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
                            decoration: BoxDecoration(color: AppTheme.neonGreen.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                            child: const Text("XOST", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: AppTheme.neonGreen)),
                          ),
                        ],
                        if (isBot) ...[
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
                            decoration: BoxDecoration(color: AppTheme.textMuted.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                            child: const Text("BOT", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: AppTheme.textMuted)),
                          ),
                        ],
                      ],
                    ),
                    subtitle: Text(
                      carName,
                      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                    ),
                    trailing: Icon(
                      isBot ? Icons.smart_toy_rounded : Icons.check_circle_rounded,
                      color: isBot ? AppTheme.textMuted : AppTheme.neonGreen,
                      size: 22,
                    ),
                  ),
                );
              },
            ),
          ),

          // Action row
          const SizedBox(height: 15),
          if (_isHost)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.neonGreen,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 10,
                  shadowColor: AppTheme.neonGreen.withOpacity(0.4),
                ),
                icon: const Icon(Icons.sports_motorsports_rounded, size: 22),
                label: const Text(
                  "🔥 POYGANI BOSHLASH (START RACE)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 0.5),
                ),
                onPressed: _triggerStartGame,
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.neonAmber.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.neonAmber.withOpacity(0.4)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.neonAmber),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Xost poygani boshlashini kuting...",
                    style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.neonAmber, fontSize: 13.5),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Helper car name mappings
String _getCarName(String key) {
  switch (key) {
    case 'jiguli': return 'Jiguli';
    case 'damas': return 'Damas';
    case 'matiz': return 'Matiz';
    case 'gentra': return 'Gentra';
    case 'cobalt': return 'Cobalt';
    case 'malibu': return 'Malibu 2';
    case 'tesla': return 'Tesla S';
    case 'bmw': return 'BMW M5';
    case 'mers': return 'Mers';
    case 'gelik': return 'Gelik';
    case 'lambo': return 'Lambo';
    case 'ferrari': return 'Ferrari';
    default: return 'Mashina';
  }
}
