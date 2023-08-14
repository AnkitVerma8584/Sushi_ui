import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiTab extends StatelessWidget {
  const SushiTab(
      {super.key,
      required this.isSelected,
      required this.sushiName,
      required this.sushiImage});

  final bool isSelected;
  final String sushiName, sushiImage;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              Image.asset(
                sushiImage,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 12),
              Text(
                sushiName,
                style: GoogleFonts.montserrat(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ));
  }
}
