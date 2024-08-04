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
        if (!controller.isStarted.value) {
          controller.start();
        }
        ;
        if (timerProvider.paused) {
          controller.pause();
        } else {
          controller.resume();
        }
        return CircularCountDownTimer(
          duration: 10 * 60,
          initialDuration: 0,
          controller: controller,
          width: width / 2,
          height: height / 2,
          fillColor: Colors.grey,
          strokeWidth: width * .75,
          ringColor: Colors.black,
          autoStart: false,
          isReverse: true,
          strokeCap: StrokeCap.butt,
          textStyle: const TextStyle(
            fontSize: 23.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ),
          textAlign: TextAlign.center,
          textFormat: CountdownTextFormat.MM_SS,
        );
      },
    );
  }
}
