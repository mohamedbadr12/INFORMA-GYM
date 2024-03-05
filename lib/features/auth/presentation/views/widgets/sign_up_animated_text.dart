import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';

class SignUpAnimatedText extends StatelessWidget {
  const SignUpAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
        fontFamily: 'Bobbers',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('It is not enough to do your best,'),
          TyperAnimatedText('you must know what to do,'),
          TyperAnimatedText('and then do your best'),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        displayFullTextOnTap: true,
        stopPauseOnTap: false,

      ),
    );
  }
}
