import 'package:flutter/material.dart';
import 'package:writing_app/utils/shared_prefs.dart';
import 'package:writing_app/views/interface.dart';

class WritingApp extends StatelessWidget {
  const WritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPrefs().userName = 'russell';
    return Interface();
  }
}
