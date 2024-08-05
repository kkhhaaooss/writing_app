import 'package:flutter/material.dart';
import 'package:writing_app/views/interface.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Settings Page'),
            ElevatedButton(
              child: const Text('Save Prefs'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Interface()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
