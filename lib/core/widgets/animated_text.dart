import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class AnimatedTextAuth extends StatelessWidget {
  const AnimatedTextAuth({super.key,required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return  AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          speed: const Duration(milliseconds: 150),
          textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      displayFullTextOnTap: true,
      stopPauseOnTap: false,
    );
  }
}