import 'package:flutter/material.dart';

class CardR extends StatelessWidget {
  final Color color;
  final Widget myChild;
  final VoidCallback onPress;

  const CardR(
      {super.key,
      required this.color,
      required this.myChild,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: myChild,
        ),
      ),
    );
  }
}
