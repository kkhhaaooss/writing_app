import 'package:flutter/material.dart';
import 'package:writing_app/utils/shared_prefs.dart';

class SettingsProvider extends ChangeNotifier {
  String _appTheme = SharedPrefs().appTheme;

  String get appTheme => _appTheme;

  void setAppTheme(String newTheme) {
    _appTheme = newTheme;
    notifyListeners();
  }
}
