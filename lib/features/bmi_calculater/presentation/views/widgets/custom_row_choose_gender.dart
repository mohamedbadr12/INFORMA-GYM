import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmi_view_body.dart';
import 'card.dart';
import 'icon_with_label.dart';

class CustomRowChooseGender extends StatefulWidget {
  const CustomRowChooseGender({super.key});

  @override
  State<CustomRowChooseGender> createState() => _CustomRowChooseGenderState();
}

class _CustomRowChooseGenderState extends State<CustomRowChooseGender> {
  final inactiveColor = const Color(0xff1d1e33);
  final activeColor = const Color(0x011d1e33);
  GenderSelection? selection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: Row(
        children: [
          Expanded(
            child: CardR(
              color: selection == GenderSelection.female
                  ? activeColor
                  : inactiveColor,
              myChild: const IconWithLabel(
                  icon: FontAwesomeIcons.mars, label: "MALE"),
              onPress: () {
                setState(() {
                  selection = GenderSelection.male;
                });
              },
            ),
          ),
          Expanded(
            child: CardR(
              color: selection == GenderSelection.female
                  ? inactiveColor
                  : activeColor,
              myChild: const IconWithLabel(
                  icon: FontAwesomeIcons.venus, label: "FEMALE"),
              onPress: () {
                setState(() {
                  selection = GenderSelection.female;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
