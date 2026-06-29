import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase Cloud Firestore uchun xavfsiz (safe-access) servis.
/// Firebase yuklanmagan yoki xato bo'lgan platformalarda (masalan, Web configuration'siz)
/// ilovani qulatmaydi, balki offline rejimga o'tadi.
class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // ─── SAFE ACCESS GETTERS ─────────────────────────
  
  /// Firebase App initialized bo'lganini tekshirish
  bool get isFirebaseAvailable {
    try {
      Firebase.app();
      return true;
    } catch (_) {
      return false;
    }
  }

  FirebaseAuth? get _auth {
    try {
      if (isFirebaseAvailable) {
        return FirebaseAuth.instance;
      }
    } catch (_) {}
    return null;
  }

  FirebaseFirestore? get _firestore {
    try {
      if (isFirebaseAvailable) {
        return FirebaseFirestore.instance;
      }
    } catch (_) {}
    return null;
  }

  // ─── AUTH ────────────────────────────────────────
  User? get currentUser => _auth?.currentUser;
  String? get uid => _auth?.currentUser?.uid;
  bool get isLoggedIn => uid != null;

  /// Anonim kirish
  Future<User?> signInAnonymously() async {
    final auth = _auth;
    if (auth == null) return null;
    try {
      final credential = await auth.signInAnonymously();
      return credential.user;
    } catch (e) {
      print('FirebaseService: Anonim kirishda xatolik: $e');
      return null;
    }
  }

  /// Auth holatini tinglash
  Stream<User?> get authStateChanges {
    final auth = _auth;
    if (auth == null) return const Stream.empty();
    return auth.authStateChanges();
  }

  // ─── USER PROGRESS (python_users) ──────────────────────────────
  DocumentReference? _userDoc() {
    final firestore = _firestore;
    final userUid = uid;
    if (firestore == null || userUid == null) return null;
    return firestore.collection('python_users').doc(userUid);
  }

  /// Foydalanuvchi ma'lumotlarini saqlash
  Future<void> saveUserProgress({
    required String name,
    required String group,
    required String phoneNumber,
    required int xp,
    required int coins,
    required String equippedCar,
    required List<int> completedLessons,
    required List<int> completedQuizzes,
    required List<int> bookmarkedLessons,
    required List<String> unlockedCars,
    required int currentLessonNumber,
  }) async {
    final doc = _userDoc();
    if (doc == null) return;
    try {
      await doc.set({
        'name': name,
        'group': group,
        'phoneNumber': phoneNumber,
        'xp': xp,
        'coins': coins,
        'equippedCar': equippedCar,
        'completedLessons': completedLessons,
        'completedQuizzes': completedQuizzes,
        'bookmarkedLessons': bookmarkedLessons,
        'unlockedCars': unlockedCars,
        'currentLessonNumber': currentLessonNumber,
        'level': 1 + (xp ~/ 100),
        'lastSeen': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('FirebaseService: Progress saqlashda xatolik: $e');
    }
  }

  /// Foydalanuvchi ma'lumotlarini yuklash
  Future<Map<String, dynamic>?> loadUserProgress() async {
    final doc = _userDoc();
    if (doc == null) return null;
    try {
      final snapshot = await doc.get();
      if (snapshot.exists && snapshot.data() != null) {
        return snapshot.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('FirebaseService: Progress yuklashda xatolik: $e');
    }
    return null;
  }

  /// Foydalanuvchi progressini real-time tinglash
  Stream<DocumentSnapshot> get userProgressStream {
    final doc = _userDoc();
    if (doc == null) return const Stream.empty();
    return doc.snapshots();
  }

  // ─── LEADERBOARD ────────────────────────────────
  /// Leaderboard'ga yozish
  Future<void> updateLeaderboard({
    required String name,
    required int xp,
    required int level,
  }) async {
    final doc = _userDoc();
    if (doc == null) return;
    try {
      await doc.set({
        'name': name,
        'xp': xp,
        'level': level,
        'lastSeen': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('FirebaseService: Leaderboard yangilashda xatolik: $e');
    }
  }

  /// Top o'yinchilarni olish (XP bo'yicha)
  Future<List<Map<String, dynamic>>> getLeaderboard({int limit = 50}) async {
    final firestore = _firestore;
    if (firestore == null) return [];
    try {
      final querySnapshot = await firestore
          .collection('python_users')
          .orderBy('xp', descending: true)
          .limit(limit)
          .get();
      
      final List<Map<String, dynamic>> players = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        data['uid'] = doc.id;
        players.add(data);
      }
      return players;
    } catch (e) {
      print('FirebaseService: Leaderboard olishda xatolik: $e');
      return [];
    }
  }

  /// Real-time leaderboard oqimi
  Stream<QuerySnapshot> get leaderboardStream {
    final firestore = _firestore;
    if (firestore == null) return const Stream.empty();
    return firestore
        .collection('python_users')
        .orderBy('xp', descending: true)
        .limit(50)
        .snapshots();
  }

  // ─── MULTIPLAYER ROOMS (python_game_scores) ──────────────────────────
  DocumentReference? _roomDoc(String roomId) {
    final firestore = _firestore;
    if (firestore == null) return null;
    return firestore.collection('python_game_scores').doc(roomId);
  }

  /// Xonaga qo'shilish
  Future<void> joinRoom({
    required String roomId,
    required String playerName,
    required String carKey,
  }) async {
    final doc = _roomDoc(roomId);
    final userUid = uid;
    if (doc == null || userUid == null) return;
    
    try {
      final snapshot = await doc.get();
      
      // Xona mavjud bo'lmasa, uni yaratish
      if (!snapshot.exists) {
        await doc.set({
          'status': 'waiting',
          'hostId': userUid,
          'createdAt': FieldValue.serverTimestamp(),
          'players': {
            userUid: {
              'name': playerName,
              'car': carKey,
              'score': 0,
              'position': 0.0,
              'lane': 1,
              'isReady': true,
              'lastSeen': DateTime.now().millisecondsSinceEpoch,
            }
          }
        });
      } else {
        // Xona mavjud bo'lsa, players xaritasiga yangi o'yinchini qo'shish
        await doc.update({
          'players.$userUid': {
            'name': playerName,
            'car': carKey,
            'score': 0,
            'position': 0.0,
            'lane': 1,
            'isReady': true,
            'lastSeen': DateTime.now().millisecondsSinceEpoch,
          }
        });
      }
    } catch (e) {
      print('FirebaseService: Xonaga kirishda xatolik: $e');
    }
  }

  /// Xonadan chiqish
  Future<void> leaveRoom(String roomId) async {
    final doc = _roomDoc(roomId);
    final userUid = uid;
    if (doc == null || userUid == null) return;
    
    try {
      final snapshot = await doc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        final players = Map<String, dynamic>.from(data?['players'] ?? {});
        players.remove(userUid);
        
        if (players.isEmpty) {
          await doc.delete();
        } else {
          // Agar host o'zi chiqqan bo'lsa, boshqa o'yinchini host qilish
          String? newHostId = data?['hostId'];
          if (newHostId == userUid) {
            newHostId = players.keys.first;
          }
          await doc.update({
            'hostId': newHostId,
            'players': players,
          });
        }
      }
    } catch (e) {
      print('FirebaseService: Xonadan chiqishda xatolik: $e');
    }
  }

  /// O'yin holatini yangilash (o'yinchining pozitsiyasi, ochkosi, lane)
  Future<void> updatePlayerState({
    required String roomId,
    required double position,
    required int score,
    required int lane,
  }) async {
    final doc = _roomDoc(roomId);
    final userUid = uid;
    if (doc == null || userUid == null) return;
    try {
      await doc.update({
        'players.$userUid.position': position,
        'players.$userUid.score': score,
        'players.$userUid.lane': lane,
        'players.$userUid.lastSeen': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (_) {}
  }

  /// O'yinchi holatini to'liq yangilash (code, finished, va h.k.)
  Future<void> updatePlayerFields(String roomId, Map<String, dynamic> fields) async {
    final doc = _roomDoc(roomId);
    final userUid = uid;
    if (doc == null || userUid == null) return;
    try {
      final updates = <String, dynamic>{};
      fields.forEach((key, value) {
        updates['players.$userUid.$key'] = value;
      });
      await doc.update(updates);
    } catch (e) {
      print('FirebaseService: Player field yangilashda xatolik: $e');
    }
  }

  /// Bot holatini yangilash (host tomonidan)
  Future<void> updateBotState(String roomId, String botId, Map<String, dynamic> updates) async {
    final doc = _roomDoc(roomId);
    if (doc == null) return;
    try {
      final dbUpdates = <String, dynamic>{};
      updates.forEach((key, value) {
        dbUpdates['players.$botId.$key'] = value;
      });
      await doc.update(dbUpdates);
    } catch (e) {
      print('FirebaseService: Bot state yangilashda xatolik: $e');
    }
  }

  /// Xona statusini yangilash (status: playing, finished)
  Future<void> updateRoomStatus(String roomId, String status) async {
    final doc = _roomDoc(roomId);
    if (doc == null) return;
    try {
      await doc.update({'status': status});
    } catch (e) {
      print('FirebaseService: Xona statusini yangilashda xatolik: $e');
    }
  }

  /// Xona o'yinchilarini real-time tinglash
  Stream<DocumentSnapshot> roomStream(String roomId) {
    final doc = _roomDoc(roomId);
    if (doc == null) return const Stream.empty();
    return doc.snapshots();
  }

  /// Host ekanligini tekshirish
  Future<bool> isHost(String roomId) async {
    final doc = _roomDoc(roomId);
    final userUid = uid;
    if (doc == null || userUid == null) return false;
    try {
      final snapshot = await doc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        return data?['hostId'] == userUid;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Botlarni qo'shish (host tomonidan)
  Future<void> seedBots({
    required String roomId,
    required int count,
    required List<String> botNames,
    required List<String> carKeys,
  }) async {
    final doc = _roomDoc(roomId);
    if (doc == null) return;
    try {
      final random = DateTime.now().millisecondsSinceEpoch;
      final Map<String, dynamic> botUpdates = {};
      
      for (int i = 0; i < count; i++) {
        final botId = 'bot_${random}_$i';
        final nameIndex = i % botNames.length;
        final carIndex = i % carKeys.length;
        
        botUpdates['players.$botId'] = {
          'name': botNames[nameIndex],
          'car': carKeys[carIndex],
          'score': 0,
          'position': 0.0,
          'lane': (i % 3) + 1,
          'isBot': true,
          'isReady': true,
          'lastSeen': DateTime.now().millisecondsSinceEpoch,
        };
      }
      
      await doc.update(botUpdates);
    } catch (e) {
      print('FirebaseService: Bot qo\'shishda xatolik: $e');
    }
  }
}
