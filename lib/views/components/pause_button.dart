import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/timer_provider.dart';
import 'package:writing_app/utils/shared_prefs.dart';

class PauseButton extends StatelessWidget {
  PauseButton({super.key});
  final btnFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return SizedBox(
          width: SharedPrefs().screenWidth * 0.4,
          child: ElevatedButton(
            focusNode: btnFocusNode,
            autofocus: true,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color.fromARGB(255, 146, 190, 212),
            ),
            onPressed: () {
              btnFocusNode.unfocus();
              timerProvider.togglePause();
            },
            child: Text(
              timerProvider.paused ? 'Write!' : 'Pause Writing',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
