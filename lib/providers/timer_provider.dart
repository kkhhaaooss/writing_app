import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  bool _isPaused = true;

  bool get paused => _isPaused;

  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }
}
