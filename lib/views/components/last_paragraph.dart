import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';

class LastParagraph extends StatelessWidget {
  const LastParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return Text(textProvider.text);
      },
    );
  }
}
