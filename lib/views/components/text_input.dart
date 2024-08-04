import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';
// import 'package:writing_app/providers/timer_provider.dart';

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
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return TextField(
          focusNode: focusNode,
          canRequestFocus: true,
          maxLines: 5,
          minLines: 5,
          onTap: () => focusNode.requestFocus(),
          controller: _textController,
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
