import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomRowChooseGender extends StatefulWidget {
  const CustomRowChooseGender({super.key, required this.onIndexChanged});

  final void Function(int) onIndexChanged;

  @override
  State<CustomRowChooseGender> createState() => _CustomRowChooseGenderState();
}

class _CustomRowChooseGenderState extends State<CustomRowChooseGender> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                  widget.onIndexChanged(selectedIndex);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  gradient: selectedIndex == 0
                      ? const LinearGradient(colors: [
                    Colors.green,
                    Colors.green,
                  ])
                      : const LinearGradient(
                      colors: [kSecondaryColor, Color(0xff281537)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("Male", style: Styles.textStyle20(context)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                  widget.onIndexChanged(selectedIndex);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  gradient: selectedIndex == 1
                      ? const LinearGradient(colors: [
                    Colors.green,
                    Colors.green,
                  ])
                      : const LinearGradient(
                      colors: [kSecondaryColor, Color(0xff281537)]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text("Female", style: Styles.textStyle20(context)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
