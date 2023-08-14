import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_ui/theme/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: myBorderRadiusLarge),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: GoogleFonts.montserrat(color: Colors.white)),
            const SizedBox(width: 20),
            const Icon(CupertinoIcons.arrow_right,
                size: 18, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
