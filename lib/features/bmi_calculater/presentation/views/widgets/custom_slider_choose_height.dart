import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/features/bmi_calculater/presentation/manger/bmi_cubit/bmi_cubit.dart';

import 'card.dart';

class CustomSliderChooseHeight extends StatefulWidget {
  const CustomSliderChooseHeight({
    super.key,
  });

  @override
  State<CustomSliderChooseHeight> createState() =>
      _CustomSliderChooseHeightState();
}

class _CustomSliderChooseHeightState extends State<CustomSliderChooseHeight> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: CardR(
        color: const Color(0xff1d1e33),
        onPress: () {},
        myChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "HEIGHT",
              style: TextStyle(color: Colors.white60, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  BlocProvider.of<BmiCubit>(context).height.toString(),
                  style: const TextStyle(
                      fontSize: 47,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60),
                ),
                const Text(
                  "CM",
                  style: TextStyle(color: Colors.white60),
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  activeTrackColor: Colors.white,
                  thumbColor: Colors.pink,
                  overlayColor: const Color(0xffeb1555),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30)),
              child: Slider(
                max: 220,
                min: 120,
                onChanged: (double newValue) {
                  setState(() {
                    BlocProvider.of<BmiCubit>(context).height =
                        newValue.toInt().round();
                  });
                },
                value: BlocProvider.of<BmiCubit>(context).height.toDouble(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
