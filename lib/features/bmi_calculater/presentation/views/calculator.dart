import 'package:flutter/material.dart';
import 'package:informa3/core/utils/styles.dart';
import 'package:informa3/features/bmi_calculater/presentation/views/widgets/custom_container_choose_calculator.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.center,
            child: Text("CALCULATE YOUR BODY ",
                style: Styles.textStyle28Bold(context))),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.center,
          child: Text("USING ?", style: Styles.textStyle28Bold(context)),
        ),
        const SizedBox(height: 80),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/bmi_view');
          },
          child: const CustomContainerChooseCalculator(
            text: "BMI",
          ),
        ),
        const SizedBox(height: 60),
        InkWell(onTap: () {
          Navigator.pushNamed(context, '/bmr_view');

        },
          child: const CustomContainerChooseCalculator(
            text: "BMR",
          ),
        ),
      ],
    );
  }
}

