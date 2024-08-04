import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/timer_provider.dart';

class PauseButton extends StatelessWidget {
  PauseButton({super.key});
  final btnFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return ElevatedButton(
          focusNode: btnFocusNode,
          autofocus: true,
          onPressed: () {
            btnFocusNode.unfocus();
            timerProvider.togglePause();
          },
          child: Text(timerProvider.paused ? 'Write!' : 'Pause Writing'),
        );
      },
    );
  }
}
