import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sushi_ui/pages/intro/intro_page.dart';

import '../../theme/constants.dart';
import '../home/home_page.dart';

class ScaleUpButton extends StatelessWidget {
  const ScaleUpButton({super.key, required this.page});
  final IntroPage page;
  static final tween = Tween<double>(begin: 0.0, end: 1.0);
  static const duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: tween,
        duration: duration,
        builder: (_, double scale, btn) {
          return Transform.scale(
            scale: scale,
            child: btn,
          );
        },
        child: GetStartedButton(page: page));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.page});
  final IntroPage page;
  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const HomePage(),
                  duration: animDuration,
                  curve: Curves.decelerate,
                  childCurrent: page,
                  type: PageTransitionType.bottomToTopJoined));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              return Theme.of(context)
                  .colorScheme
                  .onPrimary
                  .withOpacity(0.2); // Use the component's default.
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Get Started",
                  style: GoogleFonts.montserrat(
                      fontSize: 18, color: Colors.white)),
              const SizedBox(width: 20),
              const Icon(CupertinoIcons.arrow_right,
                  size: 18, color: Colors.white)
            ],
          ),
        ));
  }
}
