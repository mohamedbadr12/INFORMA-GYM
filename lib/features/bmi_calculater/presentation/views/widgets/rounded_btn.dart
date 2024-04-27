import 'package:flutter/material.dart';

class RoundedBTN extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  final Color color;

  const RoundedBTN(
      {super.key,
      required this.icon,
      required this.onPress,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 8,
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      shape: const CircleBorder(),
      fillColor: color,
      child: Icon(
        icon,
        size: 15,
        color: Colors.white,
      ),
    );
  }
}
