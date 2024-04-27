import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/features/bmr_calculator/presentation/manger/bmr_cubit/bmr_cubit.dart';
import 'package:informa3/features/bmr_calculator/presentation/views/widgets/reusable_card.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomSliderHeight extends StatefulWidget {
  const CustomSliderHeight({super.key});

  @override
  State<CustomSliderHeight> createState() => _CustomSliderHeightState();
}

class _CustomSliderHeightState extends State<CustomSliderHeight> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.29,
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HEIGHT',
              style: Styles.kLabelTextStyle18(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  BlocProvider.of<BmrCubit>(context).height.toString(),
                  style: Styles.kNumberTextStyle50(context),
                ),
                Text(
                  ' cm',
                  style: Styles.kLabelTextStyle18(context),
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: const Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
              ),
              child: Slider(
                value: BlocProvider.of<BmrCubit>(context).height.toDouble(),
                min: 100,
                max: 250,
                onChanged: (double newValue) {
                  setState(() {
                    BlocProvider.of<BmrCubit>(context).height =
                        newValue.round();
                  });
                },
              ),
            ),
          ],
        ),
        onPress: () {},
      ),
    );
  }
}
