import 'package:flutter/material.dart';
import 'package:writing_app/utils/shared_prefs.dart';
import 'package:writing_app/views/interface.dart';

class WritingApp extends StatelessWidget {
  const WritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode appTheme =
        SharedPrefs().appTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    return MaterialApp(
      title: 'Writing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: appTheme,
      home: Interface(),
    );
  }
}
