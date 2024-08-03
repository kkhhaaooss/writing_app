import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/timer_provider.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return ElevatedButton(
          onPressed: () {
            timerProvider.togglePause();
          },
          child: Text(timerProvider.paused ? 'Write!' : 'Pause Writing'),
        );
      },
    );
  }
}
