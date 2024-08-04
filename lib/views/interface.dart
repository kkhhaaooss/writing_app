import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';
import 'package:writing_app/providers/timer_provider.dart';
import 'package:writing_app/views/components/last_paragraph.dart';
import 'package:writing_app/views/components/pause_button.dart';
import 'package:writing_app/views/components/text_input.dart';
import 'package:writing_app/views/components/turn_timer.dart';

class Interface extends StatelessWidget {
  Interface({super.key});
  final CountDownController timerController = CountDownController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final widthPadding = screenWidth * 0.05;
    final heightPadding = screenHeight * 0.05;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TextProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widthPadding,
                vertical: heightPadding,
              ),
              child: ListView(
                children: [
                  TurnTimer(
                    controller: timerController,
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.2,
                  ),
                  const SizedBox(height: 40),
                  LastParagraph(
                    height: screenHeight * 0.2,
                  ),
                  const SizedBox(height: 40),
                  const TextInput(),
                  const SizedBox(height: 40),
                  const PauseButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
