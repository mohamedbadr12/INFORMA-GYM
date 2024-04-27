import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomContainerChooseCalculator extends StatelessWidget {
  final String text;

  const CustomContainerChooseCalculator({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xff281537), kSecondaryColor]),
          borderRadius: BorderRadius.circular(25)),
      child: Align(
          alignment: Alignment.center,
          child: Text(text, style: Styles.textStyle25(context))),
    );
  }
}
