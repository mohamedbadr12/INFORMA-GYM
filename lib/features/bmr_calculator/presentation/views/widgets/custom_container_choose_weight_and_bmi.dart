import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:informa3/features/bmr_calculator/presentation/manger/bmr_cubit/bmr_cubit.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/reusable_card.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/rounded_icon_button.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomContainerChooseWeightAndBmi extends StatefulWidget {
  const CustomContainerChooseWeightAndBmi({super.key});

  @override
  State<CustomContainerChooseWeightAndBmi> createState() =>
      _CustomContainerChooseWeightAndBmiState();
}

class _CustomContainerChooseWeightAndBmiState
    extends State<CustomContainerChooseWeightAndBmi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style: Styles.kLabelTextStyle18(context),
                  ),
                  Text(
                    BlocProvider.of<BmrCubit>(context).weight.toString(),
                    style: Styles.kNumberTextStyle50(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            BlocProvider.of<BmrCubit>(context).weight--;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            BlocProvider.of<BmrCubit>(context).weight++;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BMI',
                    style: Styles.kLabelTextStyle18(context),
                  ),
                  Text(
                    BlocProvider.of<BmrCubit>(context).bmi.toString(),
                    style: Styles.kNumberTextStyle50(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              BlocProvider.of<BmrCubit>(context).bmi--;
                            });
                          }),
                      const SizedBox(width: 10),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            BlocProvider.of<BmrCubit>(context).bmi++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
