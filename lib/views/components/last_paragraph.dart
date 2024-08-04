import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';

class LastParagraph extends StatelessWidget {
  const LastParagraph({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return Container(
          height: height,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 146, 190, 212),
              border: Border.all(
                  width: 3, color: Colors.black, style: BorderStyle.solid)),
          child: Text(
            textProvider.text,
            style: TextStyle(
              fontFamily: GoogleFonts.merriweather().fontFamily,
              color: const Color.fromARGB(255, 58, 27, 27),
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
