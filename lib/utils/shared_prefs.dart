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

  String get appTheme => _sharedPrefs.getString(keyAppTheme) ?? 'dark';

  String get userName => _sharedPrefs.getString(keyUsername) ?? 'User';

  int get turnLength => _sharedPrefs.getInt(keyTurnLength) ?? 10;

  double get screenWidth =>
      _sharedPrefs.getDouble(keyScreenWidth) ?? double.infinity;

  double get screenHeight =>
      _sharedPrefs.getDouble(keyScreenHeight) ?? double.infinity;

  // getters for currentDocument shared prefs

  int get currentDocumentTurns =>
      _sharedPrefs.getInt(keyCurrentDocumentTurns) ?? 0;

  int get currentDocumentParagraphs =>
      _sharedPrefs.getInt(keyCurrentDocumentParagraphs) ?? 0;

  // setters for shared prefs

  set appTheme(String value) {
    _sharedPrefs.setString(keyAppTheme, value);
  }

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

  // setters for currentDocument shared prefs

  set currentDocumentTurns(int value) {
    _sharedPrefs.setInt(keyCurrentDocumentTurns, value);
  }

  set currentDocumentParagraphs(int value) {
    _sharedPrefs.setInt(keyCurrentDocumentParagraphs, value);
  }
}

// keys for shared prefs
const String keyAppTheme = 'key_app_theme';
const String keyUsername = 'key_username';
const String keyTurnLength = 'key_turn_length';
const String keyScreenWidth = 'key_screen_width';
const String keyScreenHeight = 'key_screen_height';

// keys for currentDocument shared prefs
const String keyCurrentDocumentTurns = 'key_document_turns';
const String keyCurrentDocumentParagraphs = 'key_document_paragraphs';
