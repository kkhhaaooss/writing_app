import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';
import 'package:writing_app/providers/timer_provider.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.timerController,
  });
  final CountDownController timerController;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final myFocusNode = FocusNode();
  final _textController = TextEditingController();

  /// Updates the display with the given text.
  ///
  /// This function splits the text into lines and checks if there are more than one line as a check for a paragraph break.
  /// If there are, it updates the text in LastParagraph widget using the `TextProvider` and clears the text controller.
  /// Finally, it calls `setState` to trigger a rebuild of the widget.
  ///
  /// Parameters:
  /// - `text`: The text to be displayed.
  ///
  /// Returns: None.
  void _updateDisplay(text) {
    List<String> lines = _textController.text.split('\n');

    // Update only after a return
    if (lines.length > 1) {
      context.read<TextProvider>().updateText(_textController.text);

      _textController.clear();

      setState(() {});
    }
  }

  /// Counts the number of words in a given text.
  ///
  /// The text parameter is expected to be a string. The function trims any leading or trailing whitespace
  /// from the text and then splits it into individual words using a regular expression that matches
  /// one or more whitespace characters. The number of words is then returned.
  ///
  /// Returns an integer representing the number of words in the text.
  ///
  /// Parameters:
  ///   - text: A required string containing the text to count the number of words in.
  ///
  /// Returns:
  ///   - An integer representing the number of words in the text.
  int _countWords({required String text}) {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) {
      return 0;
    } else {
      return trimmedText.split(RegExp("\\s+")).length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TextProvider, TimerProvider>(
      builder: (context, textProvider, timerProvider, child) {
        if (!timerProvider.paused) {
          myFocusNode.requestFocus();
        } else {
          myFocusNode.unfocus();
        }
        return TextField(
          focusNode: myFocusNode,
          // canRequestFocus: true,
          maxLines: 5,
          minLines: 5,
          controller: _textController,
          enabled: !timerProvider.paused,
          onChanged: (text) => _updateDisplay(text),
          // onSubmitted: (text) => _updateDisplay(text),
          style: GoogleFonts.merriweather(),
          decoration: InputDecoration(
            counterText: '${_countWords(text: _textController.text)} words',
            labelText: 'Write Here',
            alignLabelWithHint: true,
            hintText: 'Write something...',
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
