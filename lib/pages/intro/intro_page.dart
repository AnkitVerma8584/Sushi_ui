import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_ui/theme/colors.dart';
import 'package:sushi_ui/theme/constants.dart';

import 'get_started_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(
          child: Stack(children: [
        Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(-pi * 1 / 4),
            child: Image.asset(japFoodBackgroundImage),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Text("SUSHIMAN",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 24, color: Colors.white)),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16.0),
                    child: Image.asset(
                      japFoodIconImage,
                      height: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    noodlesImage,
                    height: 300,
                  ),
                ),
              ]),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "THE TASTE OF JAPANESE FOOD",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 50, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Feel the taste of most populars Japanese foods from anywhere and anytime.",
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[300], height: 2),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ScaleUpButton(page: this),
              )
            ],
          ),
        ),
      ])),
    );
  }
}
