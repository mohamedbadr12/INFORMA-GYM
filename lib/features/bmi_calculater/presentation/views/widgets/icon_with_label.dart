import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconWithLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white60,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white60),
        )
      ],
    );
  }
}