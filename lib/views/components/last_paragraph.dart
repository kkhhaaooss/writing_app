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
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 146, 190, 212),
              border: Border.all(
                  width: 3, color: Colors.black, style: BorderStyle.solid)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last Paragraph:',
                style: GoogleFonts.merriweather(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 22, 48, 113),
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                textProvider.text,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                ),
                maxLines: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}
