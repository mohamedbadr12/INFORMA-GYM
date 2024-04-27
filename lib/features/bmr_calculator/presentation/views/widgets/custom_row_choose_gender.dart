import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/reusable_card.dart';

import '../../../../../core/utils/constant.dart';
import 'bmr_view_body.dart';
import 'icon_button.dart';

class CustomRowChooseGender extends StatefulWidget {
  const CustomRowChooseGender({super.key});

  @override
  State<CustomRowChooseGender> createState() => _CustomRowChooseGenderState();
}

class _CustomRowChooseGenderState extends State<CustomRowChooseGender> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male
                  ? kActiveCardColour
                  : kInactiveCardColour,
              cardChild: const IconContent(
                icon: FontAwesomeIcons.mars,
                label: 'MALE',
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              colour: selectedGender == Gender.female
                  ? kActiveCardColour
                  : kInactiveCardColour,
              cardChild: const IconContent(
                icon: FontAwesomeIcons.venus,
                label: 'FEMALE',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
