import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';
import 'package:writing_app/providers/timer_provider.dart';
import 'package:writing_app/utils/shared_prefs.dart';
import 'package:writing_app/views/components/last_paragraph.dart';
import 'package:writing_app/views/components/pause_button.dart';
import 'package:writing_app/views/components/text_input.dart';
import 'package:writing_app/views/components/turn_timer.dart';
import 'package:writing_app/views/settings_page.dart';

class Interface extends StatelessWidget {
  Interface({super.key});
  final CountDownController timerController = CountDownController();

  @override
  Widget build(BuildContext context) {
    SharedPrefs().screenWidth = MediaQuery.sizeOf(context).width;
    SharedPrefs().screenHeight = MediaQuery.sizeOf(context).height;

    // Set up providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TextProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Writing App for ${SharedPrefs().userName}'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              child: const Icon(Icons.settings),
            ),
          ],
        ),
        // Drawer for file selection
        drawer: const Drawer(),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TurnTimer(
                  controller: timerController,
                  height: SharedPrefs().screenHeight * 0.2,
                  width: SharedPrefs().screenWidth * 0.2,
                ),
                const SizedBox(height: 40),
                LastParagraph(
                  height: SharedPrefs().screenHeight * 0.2,
                ),
                const SizedBox(height: 40),
                PauseButton(),
                const SizedBox(height: 40),
                TextInput(
                  timerController: timerController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
