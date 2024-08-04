import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:writing_app/providers/text_provider.dart';

class LastParagraph extends StatelessWidget {
  const LastParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextProvider>(
      builder: (context, textProvider, child) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(
                  width: 3, color: Colors.black, style: BorderStyle.solid)),
          child: Text(
            textProvider.text,
            style: TextStyle(
              fontFamily: GoogleFonts.merriweather().fontFamily,
              color: Colors.white,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
