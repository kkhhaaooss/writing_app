import 'package:flutter/material.dart';
import 'package:writing_app/utils/shared_prefs.dart';
import 'package:writing_app/writing_app.dart';

Future<void> main() async {
  await SharedPrefs().init();
  runApp(const WritingApp());
}
