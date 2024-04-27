import 'package:flutter/material.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomBmrButton extends StatelessWidget {
  const CustomBmrButton(
      {super.key, required this.onTap, required this.buttonTitle});

  final GestureTapCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: Styles.kLargerButtonTextStyle25(context),
          ),
        ),
      ),
    );
  }
}
