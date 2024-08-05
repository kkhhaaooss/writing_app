import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  // getters for shared prefs
  String get userName => _sharedPrefs.getString(keyUsername) ?? 'User';

  int get turnLength => _sharedPrefs.getInt(keyTurnLength) ?? 10;

  double get screenWidth =>
      _sharedPrefs.getDouble(keyScreenWidth) ?? double.infinity;

  double get screenHeight =>
      _sharedPrefs.getDouble(keyScreenHeight) ?? double.infinity;

  // setters for shared prefs
  set userName(String value) {
    _sharedPrefs.setString(keyUsername, value);
  }

  set turnLength(int value) {
    _sharedPrefs.setInt(keyTurnLength, value);
  }

  set screenWidth(double value) {
    _sharedPrefs.setDouble(keyScreenWidth, value);
  }

  set screenHeight(double value) {
    _sharedPrefs.setDouble(keyScreenHeight, value);
  }
}

// keys for shared prefs
const String keyUsername = 'key_username';
const String keyTurnLength = 'key_turn_length';
const String keyScreenWidth = 'key_screen_width';
const String keyScreenHeight = 'key_screen_height';
