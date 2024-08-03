import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';
import 'package:writing_app/providers/timer_provider.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final focusNode = FocusNode();
  final _textController = TextEditingController();

  void _updateDisplay(text) {
    List<String> lines = _textController.text.split('\n');

    // Update only after a return
    if (lines.length > 1) {
      context.read<TextProvider>().updateText(_textController.text);

      _textController.clear();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TextProvider, TimerProvider>(
      builder: (context, textProvider, timerProvider, child) {
        return TextField(
          focusNode: focusNode,
          controller: _textController,
          onChanged: (newText) {
            _updateDisplay(newText);
            // timerProvider.togglePause();
          },
        );
      },
    );
  }
}
