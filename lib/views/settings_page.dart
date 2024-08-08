import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/settings_provider.dart';
import 'package:writing_app/utils/shared_prefs.dart';
import 'package:writing_app/writing_app.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  static final List<String> themeItems = <String>[
    'light',
    'dark',
  ];
  final List<DropdownMenuItem<String>> _dropdownThemeItems = themeItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text('Settings Page'),
                  const Divider(),
                  const Text('Theme'),
                  DropdownButton<String>(
                    value: settingsProvider.appTheme,
                    onChanged: (String? newValue) {
                      () {
                        if (newValue != null) {
                          SharedPrefs().appTheme = newValue;
                          settingsProvider.setAppTheme(newValue);
                        }
                      };
                    },
                    items: _dropdownThemeItems,
                  ),
                  ElevatedButton(
                    child: const Text('Save Prefs'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WritingApp()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
