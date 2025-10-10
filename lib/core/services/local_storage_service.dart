import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_images.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  late SharedPreferences _prefs;

  LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  // Инициализация один раз
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // SETTINGS
  bool get soundEnabled => _prefs.getBool('sound_enabled') ?? false;
  set soundEnabled(bool value) => _prefs.setBool('sound_enabled', value);

  bool get vibrationEnabled => _prefs.getBool('vibration_enabled') ?? false;
  set vibrationEnabled(bool value) => _prefs.setBool('vibration_enabled', value);

  bool get notificationsEnabled => _prefs.getBool('notifications_enabled') ?? false;
  set notificationsEnabled(bool value) => _prefs.setBool('notifications_enabled', value);

  // PLAYER DATA
  String get playerName => _prefs.getString('player_name') ?? 'Player';
  set playerName(String value) => _prefs.setString('player_name', value);

  String get playerEmail => _prefs.getString('player_email') ?? '';
  set playerEmail(String value) => _prefs.setString('player_email', value);

  String get playerAvatar => _prefs.getString('player_avatar') ?? AppImages.chickenMale;
  set playerAvatar(String value) => _prefs.setString('player_avatar', value);

  int get highScore => _prefs.getInt('high_score') ?? 0;
  set highScore(int value) => _prefs.setInt('high_score', value);

  // Дополнительные методы
  void resetSettings() {
    soundEnabled = false;
    vibrationEnabled = false;
    notificationsEnabled = false;
  }
}
