import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/timer_provider.dart';
import 'package:writing_app/utils/shared_prefs.dart';

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

  void addTurn() {
    SharedPrefs().currentDocumentTurns += 1;
  }

  void resetTimer() {
    controller.pause();
    addTurn();
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        if (!controller.isStarted.value) {
          controller.start();
        }

        if (timerProvider.paused) {
          controller.pause();
        } else {
          controller.resume();
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(!timerProvider.paused ? '' : 'Time Left: '),
                CircularCountDownTimer(
                  duration: SharedPrefs().turnLength * 60,
                  initialDuration: 0,
                  controller: controller,
                  width: !timerProvider.paused ? width : width / 1.8,
                  height: !timerProvider.paused ? height : height / 1.8,
                  fillColor: !timerProvider.paused
                      ? Colors.grey
                      : const Color.fromARGB(0, 0, 0, 0),
                  strokeWidth: width * .75,
                  ringColor: !timerProvider.paused
                      ? Colors.black
                      : const Color.fromARGB(0, 0, 0, 0),
                  autoStart: !timerProvider.paused ? true : false,
                  isReverse: true,
                  strokeCap: StrokeCap.butt,
                  textStyle: !timerProvider.paused
                      ? const TextStyle(
                          fontSize: 23.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(128, 0, 0, 0),
                              blurRadius: 9.0,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        )
                      : const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(128, 0, 0, 0),
                              blurRadius: 9.0,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                  textAlign: TextAlign.center,
                  textFormat: CountdownTextFormat.MM_SS,
                  onComplete: resetTimer,
                ),
              ],
            ),
            Text(!timerProvider.paused
                ? ''
                : '${SharedPrefs().currentDocumentTurns} turns,\n${SharedPrefs().currentDocumentParagraphs} paragraphs on this document.')
          ],
        );
      },
    );
  }
}
