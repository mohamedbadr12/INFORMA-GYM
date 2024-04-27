import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:informa3/features/bmi_calculater/presentation/manger/bmi_cubit/bmi_cubit.dart';
import 'package:informa3/features/bmi_calculater/presentation/views/widgets/rounded_btn.dart';

import 'card.dart';

class CustomRowChooseWeightAndHeight extends StatefulWidget {
  const CustomRowChooseWeightAndHeight({
    super.key,
  });

  @override
  State<CustomRowChooseWeightAndHeight> createState() =>
      _CustomRowChooseWeightAndHeightState();
}

class _CustomRowChooseWeightAndHeightState
    extends State<CustomRowChooseWeightAndHeight> {
  int _age = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: Row(
        children: [
          Expanded(
            child: CardR(
              color: const Color(0xff1d1e33),
              onPress: () {},
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "WEIGHT ",
                    style: TextStyle(color: Colors.white60),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        BlocProvider.of<BmiCubit>(context).weight.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                      const Text(
                        "kg",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedBTN(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              BlocProvider.of<BmiCubit>(context).weight++;
                            });
                          },
                          color: const Color(0xff0A0E21)),
                      const SizedBox(
                        width: 5,
                      ),
                      RoundedBTN(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              BlocProvider.of<BmiCubit>(context).weight--;
                            });
                          },
                          color: const Color(0xff0A0E21))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CardR(
                color: const Color(0xff1d1e33),
                onPress: () {},
                myChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "AGE ",
                      style: TextStyle(color: Colors.white60),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _age.toString(),
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60),
                        ),
                        const Text(
                          "yr",
                          style: TextStyle(color: Colors.white60),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedBTN(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                _age++;
                              });
                            },
                            color: const Color(0xff0A0E21)),
                        const SizedBox(
                          width: 5,
                        ),
                        RoundedBTN(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                _age--;
                              });
                            },
                            color: const Color(0xff0A0E21))
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
