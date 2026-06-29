/// Firebase Cloud Firestore uchun xavfsiz (safe-access) servis.
/// Bu stub versiya - Firebase paketsiz ishlaydi (offline rejim).
/// APK build qilish uchun Firebase bog'liqliklari olib tashlangan.
class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // ─── SAFE ACCESS GETTERS ─────────────────────────
  bool get isFirebaseAvailable => false;
  
  // ─── AUTH ────────────────────────────────────────
  dynamic get currentUser => null;
  String? get uid => null;
  bool get isLoggedIn => false;

  Future<dynamic> signInAnonymously() async => null;

  Stream<dynamic> get authStateChanges => const Stream.empty();

  // ─── USER PROGRESS (python_users) ──────────────────────────────
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
  }) async {}

  Future<Map<String, dynamic>?> loadUserProgress() async => null;

  Stream<dynamic> get userProgressStream => const Stream.empty();

  // ─── LEADERBOARD ────────────────────────────────
  Future<void> updateLeaderboard({
    required String name,
    required int xp,
    required int level,
  }) async {}

  Future<List<Map<String, dynamic>>> getLeaderboard({int limit = 50}) async => [];

  Stream<dynamic> get leaderboardStream => const Stream.empty();

  // ─── MULTIPLAYER ROOMS ──────────────────────────
  Future<void> joinRoom({
    required String roomId,
    required String playerName,
    required String carKey,
  }) async {}

  Future<void> leaveRoom(String roomId) async {}

  Future<void> updatePlayerState({
    required String roomId,
    required double position,
    required int score,
    required int lane,
  }) async {}

  Future<void> updatePlayerFields(String roomId, Map<String, dynamic> fields) async {}

  Future<void> updateBotState(String roomId, String botId, Map<String, dynamic> updates) async {}

  Future<void> updateRoomStatus(String roomId, String status) async {}

  Stream<dynamic> roomStream(String roomId) => const Stream.empty();

  Future<bool> isHost(String roomId) async => false;

  Future<void> seedBots({
    required String roomId,
    required int count,
    required List<String> botNames,
    required List<String> carKeys,
  }) async {}
}
