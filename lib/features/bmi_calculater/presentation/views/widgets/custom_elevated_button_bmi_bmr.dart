import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/bmi_cubit/bmi_cubit.dart';

class CustomElevatedButtonBmi extends StatelessWidget {
  const CustomElevatedButtonBmi({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/bmi_result", arguments: {
          "bmi": BlocProvider.of<BmiCubit>(context).calculateBMI(),
          "result": BlocProvider.of<BmiCubit>(context).getResult(),
          "feedback": BlocProvider.of<BmiCubit>(context).feedBack(),
        });
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          minimumSize: const Size(double.infinity, 50)),
      child: Text("CALCULATE", style: Styles.textStyle20(context)),
    );
  }
}
