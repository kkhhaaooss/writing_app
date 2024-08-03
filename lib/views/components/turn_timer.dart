import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/timer_provider.dart';

class TurnTimer extends StatelessWidget {
  final CountDownController controller;
  final double width;
  final double height;

  const TurnTimer({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        if (timerProvider.paused) {
          controller.pause();
        } else {
          controller.resume();
        }
        return CircularCountDownTimer(
          duration: 10 * 60,
          initialDuration: 0,
          controller: controller,
          width: width,
          height: height,
          fillColor: Colors.grey,
          ringColor: Colors.black,
          autoStart: false,
        );
      },
    );
  }
}
