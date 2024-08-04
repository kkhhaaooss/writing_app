import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  bool _isPaused = true;
  bool _isStarted = false;

  bool get paused => _isPaused;
  bool get started => _isStarted;

  void start() {
    _isStarted = !_isStarted;
    notifyListeners();
  }

  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }
}
