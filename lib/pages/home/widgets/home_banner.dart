import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text(
              "Get 32% off",
              style: GoogleFonts.dmSerifDisplay(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Buy Food",
                    style: GoogleFonts.montserrat(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16),
                  ),
                )),
          ]),
          Image.asset(
            "assets/images/shrimp.png",
            height: 100,
            width: 100,
          )
        ]),
      ),
    );
  }
}
