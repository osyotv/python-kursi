import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:python_darslari/services/firebase_service.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  late SharedPreferences _prefs;
  final FirebaseService _firebase = FirebaseService();
  bool _initialized = false;
  bool get initialized => _initialized;

  int _xp = 0;
  int get xp => _xp;

  int _coins = 0;
  int get coins => _coins;

  int _currentLessonNumber = 1;
  int get currentLessonNumber => _currentLessonNumber;

  final Set<int> _completedLessons = {};
  Set<int> get completedLessons => _completedLessons;

  final Set<int> _completedQuizzes = {};
  Set<int> get completedQuizzes => _completedQuizzes;

  final Set<int> _bookmarkedLessons = {};
  Set<int> get bookmarkedLessons => _bookmarkedLessons;

  final Set<String> _unlockedCars = {'jiguli'};
  Set<String> get unlockedCars => _unlockedCars;

  String _equippedCar = 'default';
  String get equippedCar => _equippedCar;

  int get level => 1 + (_xp ~/ 100);

  // RO'YXATDAN O'TISH MAYDONLARI
  String _userName = "";
  String get userName => _userName;

  String _userGroup = "";
  String get userGroup => _userGroup;

  String _userPhone = "";
  String get userPhone => _userPhone;

  bool _isRegistered = false;
  bool get isRegistered => _isRegistered;

  Future<void> init() async {
    if (_initialized) return;
    _prefs = await SharedPreferences.getInstance();
    
    // 1. Avval lokal SharedPreferences'dan yuklash (tez)
    _xp = _prefs.getInt('user_xp') ?? 0;
    _coins = _prefs.getInt('user_coins') ?? _xp; // Fallback to XP retroactively
    _currentLessonNumber = _prefs.getInt('current_lesson_number') ?? 1;

    _userName = _prefs.getString('user_name') ?? "";
    _userGroup = _prefs.getString('user_group') ?? "";
    _userPhone = _prefs.getString('user_phone') ?? "";
    _isRegistered = _prefs.getBool('is_registered') ?? false;
    
    final List<String> completedList = _prefs.getStringList('completed_lessons') ?? [];
    _completedLessons.addAll(completedList.map(int.parse));

    final List<String> quizList = _prefs.getStringList('completed_quizzes') ?? [];
    _completedQuizzes.addAll(quizList.map(int.parse));

    final List<String> bookmarkList = _prefs.getStringList('bookmarked_lessons') ?? [];
    _bookmarkedLessons.addAll(bookmarkList.map(int.parse));

    final List<String> carsList = _prefs.getStringList('unlocked_cars') ?? ['jiguli'];
    _unlockedCars.clear();
    _unlockedCars.addAll(carsList);

    _equippedCar = _prefs.getString('equipped_car') ?? 'default';

    _initialized = true;
    notifyListeners();

    // 2. Firebase'dan cloud ma'lumotlarni yuklash (asinxron - bloklamaydi)
    _startFirebaseSyncListener();
  }

  /// Foydalanuvchi tizimga kirgan vaqtda avtomatik sinxronizatsiya boshlanadi
  void _startFirebaseSyncListener() {
    _firebase.authStateChanges.listen((user) {
      if (user != null) {
        _syncFromFirebase().timeout(const Duration(seconds: 4), onTimeout: () {
          print('AppState: Firebase sync timed out, using cached local progress');
        }).catchError((e) {
          print('AppState: Firebase sync error: $e');
        });
      }
    });
  }

  /// Firebase'dan ma'lumotlarni yuklash va lokal bilan birlashtirish.
  Future<void> _syncFromFirebase() async {
    if (!_firebase.isLoggedIn) return;
    
    try {
      final cloudData = await _firebase.loadUserProgress();
      
      if (cloudData != null) {
        final int cloudXP = cloudData['xp'] ?? 0;
        final int cloudCoins = cloudData['coins'] ?? 0;

        // Cloud'dagi ro'yxatdan o'tish ma'lumotlarini yuklash (agar lokal bo'sh bo'lsa)
        final String cloudName = cloudData['name'] ?? "";
        final String cloudGroup = cloudData['group'] ?? "";
        final String cloudPhone = cloudData['phoneNumber'] ?? "";

        if (cloudName.isNotEmpty && _userName.isEmpty) {
          _userName = cloudName;
          _userGroup = cloudGroup;
          _userPhone = cloudPhone;
          _isRegistered = true;
          await _prefs.setString('user_name', _userName);
          await _prefs.setString('user_group', _userGroup);
          await _prefs.setString('user_phone', _userPhone);
          await _prefs.setBool('is_registered', true);
        }
        
        if (cloudXP > _xp) {
          // Cloud'dagi progress yuqoriroq — undan yuklash
          _xp = cloudXP;
          _coins = cloudCoins;
          _currentLessonNumber = cloudData['currentLessonNumber'] ?? _currentLessonNumber;
          _equippedCar = cloudData['equippedCar'] ?? _equippedCar;
          
          if (cloudData['completedLessons'] != null) {
            _completedLessons.clear();
            _completedLessons.addAll(
              (cloudData['completedLessons'] as List).map((e) => int.parse(e.toString())),
            );
          }
          if (cloudData['completedQuizzes'] != null) {
            _completedQuizzes.clear();
            _completedQuizzes.addAll(
              (cloudData['completedQuizzes'] as List).map((e) => int.parse(e.toString())),
            );
          }
          if (cloudData['bookmarkedLessons'] != null) {
            _bookmarkedLessons.clear();
            _bookmarkedLessons.addAll(
              (cloudData['bookmarkedLessons'] as List).map((e) => int.parse(e.toString())),
            );
          }
          if (cloudData['unlockedCars'] != null) {
            _unlockedCars.clear();
            _unlockedCars.addAll(
              (cloudData['unlockedCars'] as List).map((e) => e.toString()),
            );
          }
          
          // Lokal cache'ni yangilash
          await _saveToLocal();
          notifyListeners();
        } else if (_xp > cloudXP) {
          // Lokal progress yuqoriroq — Firebase'ga yuklash
          await _syncToFirebase();
        }
      } else {
        // Firebase'da hech narsa yo'q — lokal ma'lumotlarni yuklash
        await _syncToFirebase();
      }
    } catch (e) {
      print('AppState: Firebase sync xatolik: $e');
    }
  }

  /// Barcha lokal ma'lumotlarni Firebase'ga saqlash
  Future<void> _syncToFirebase() async {
    if (!_firebase.isLoggedIn) return;
    
    try {
      final displayName = _userName.isNotEmpty ? _userName : "Bo'lajak Senior";
      await _firebase.saveUserProgress(
        name: displayName,
        group: _userGroup,
        phoneNumber: _userPhone,
        xp: _xp,
        coins: _coins,
        equippedCar: _equippedCar,
        completedLessons: _completedLessons.toList(),
        completedQuizzes: _completedQuizzes.toList(),
        bookmarkedLessons: _bookmarkedLessons.toList(),
        unlockedCars: _unlockedCars.toList(),
        currentLessonNumber: _currentLessonNumber,
      );
      
      // Leaderboard'ni ham foydalanuvchining real ismi bilan yangilash
      await _firebase.updateLeaderboard(
        name: displayName,
        xp: _xp,
        level: level,
      );
    } catch (e) {
      print('AppState: Firebase\'ga saqlashda xatolik: $e');
    }
  }

  /// Barcha ma'lumotlarni lokal SharedPreferences'ga saqlash
  Future<void> _saveToLocal() async {
    await _prefs.setInt('user_xp', _xp);
    await _prefs.setInt('user_coins', _coins);
    await _prefs.setInt('current_lesson_number', _currentLessonNumber);
    await _prefs.setString('user_name', _userName);
    await _prefs.setString('user_group', _userGroup);
    await _prefs.setString('user_phone', _userPhone);
    await _prefs.setBool('is_registered', _isRegistered);
    await _prefs.setStringList(
      'completed_lessons',
      _completedLessons.map((e) => e.toString()).toList(),
    );
    await _prefs.setStringList(
      'completed_quizzes',
      _completedQuizzes.map((e) => e.toString()).toList(),
    );
    await _prefs.setStringList(
      'bookmarked_lessons',
      _bookmarkedLessons.map((e) => e.toString()).toList(),
    );
    await _prefs.setStringList('unlocked_cars', _unlockedCars.toList());
    await _prefs.setString('equipped_car', _equippedCar);
  }

  /// Foydalanuvchini ro'yxatdan o'tkazish metodi
  Future<void> registerUser({
    required String name,
    required String group,
    required String phone,
  }) async {
    _userName = name;
    _userGroup = group;
    _userPhone = phone;
    _isRegistered = true;

    await _saveToLocal();
    notifyListeners();

    // 🔥 Firebase orqali tizimga kirib, ma'lumotlarni yuklash/yozish
    await _firebase.signInAnonymously();
    await _syncToFirebase();
  }

  Future<void> addXP(int amount) async {
    _xp += amount;
    _coins += amount; // Earn coins matched to XP!
    await _prefs.setInt('user_xp', _xp);
    await _prefs.setInt('user_coins', _coins);
    notifyListeners();
    await _syncToFirebase(); // 🔥 Firebase'ga ham saqlash
  }

  Future<void> saveCurrentLesson(int lessonNumber) async {
    _currentLessonNumber = lessonNumber;
    await _prefs.setInt('current_lesson_number', lessonNumber);
    notifyListeners();
    await _syncToFirebase(); // 🔥
  }

  Future<void> markLessonCompleted(int lessonNumber) async {
    if (!_completedLessons.contains(lessonNumber)) {
      _completedLessons.add(lessonNumber);
      await _prefs.setStringList(
        'completed_lessons',
        _completedLessons.map((e) => e.toString()).toList(),
      );
      await addXP(20); // 20 XP for finishing a lesson
      notifyListeners();
    }
  }

  Future<void> markQuizCompleted(int lessonNumber, {required int score, required int totalQuestions}) async {
    final double percentage = score / totalQuestions;
    if (percentage >= 0.8) {
      // XAVFSIZLIK: Agar ushbu imtihon avval topshirilgan bo'lsa, qayta XP berilmaydi!
      if (_completedQuizzes.contains(lessonNumber)) {
        return; // Hackingdan to'liq himoya
      }

      _completedQuizzes.add(lessonNumber);
      await _prefs.setStringList(
        'completed_quizzes',
        _completedQuizzes.map((e) => e.toString()).toList(),
      );
      
      // 80% to 99% gets 20 XP. 100% gets 100 XP.
      final xpAward = (score == totalQuestions) ? 100 : 20;
      await addXP(xpAward);
      notifyListeners();
    }
  }

  Future<void> toggleBookmark(int lessonNumber) async {
    if (_bookmarkedLessons.contains(lessonNumber)) {
      _bookmarkedLessons.remove(lessonNumber);
    } else {
      _bookmarkedLessons.add(lessonNumber);
    }
    await _prefs.setStringList(
      'bookmarked_lessons',
      _bookmarkedLessons.map((e) => e.toString()).toList(),
    );
    notifyListeners();
    await _syncToFirebase(); // 🔥
  }

  Future<bool> buyCar(String carKey, int price) async {
    if (_coins >= price && !_unlockedCars.contains(carKey)) {
      _coins -= price;
      _unlockedCars.add(carKey);
      await _prefs.setInt('user_coins', _coins);
      await _prefs.setStringList('unlocked_cars', _unlockedCars.toList());
      notifyListeners();
      await _syncToFirebase(); // 🔥
      return true;
    }
    return false;
  }

  Future<void> equipCar(String carKey) async {
    _equippedCar = carKey;
    await _prefs.setString('equipped_car', carKey);
    notifyListeners();
    await _syncToFirebase(); // 🔥
  }

  String get activeCarKey {
    if (_equippedCar == 'default' || _equippedCar.isEmpty) {
      if (level == 1) return 'jiguli';
      if (level == 2) return 'damas';
      if (level == 3) return 'matiz';
      return 'gentra';
    }
    return _equippedCar;
  }

  bool isLessonCompleted(int lessonNumber) => _completedLessons.contains(lessonNumber);
  bool isQuizCompleted(int lessonNumber) => _completedQuizzes.contains(lessonNumber);
  bool isBookmarked(int lessonNumber) => _bookmarkedLessons.contains(lessonNumber);

  // Reset progress helper for testing
  Future<void> resetProgress() async {
    _xp = 0;
    _coins = 0;
    _currentLessonNumber = 1;
    _completedLessons.clear();
    _completedQuizzes.clear();
    _bookmarkedLessons.clear();
    _unlockedCars.clear();
    _unlockedCars.add('jiguli');
    _equippedCar = 'default';
    
    await _prefs.clear();
    await _syncToFirebase(); // 🔥 Firebase'ni ham tozalash
    notifyListeners();
  }
}

// InheritedWidget to provide AppState down the tree simply
class AppStateProvider extends InheritedNotifier<AppState> {
  const AppStateProvider({
    super.key,
    required AppState super.notifier,
    required super.child,
  });

  static AppState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      final AppStateProvider? result = context.dependOnInheritedWidgetOfExactType<AppStateProvider>();
      assert(result != null, 'No AppStateProvider found in context');
      return result!.notifier!;
    } else {
      final InheritedElement? element = context.getElementForInheritedWidgetOfExactType<AppStateProvider>();
      assert(element != null, 'No AppStateProvider found in context');
      final AppStateProvider widget = element!.widget as AppStateProvider;
      return widget.notifier!;
    }
  }
}
