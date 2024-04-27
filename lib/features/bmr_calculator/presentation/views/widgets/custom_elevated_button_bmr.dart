import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/bmr_cubit/bmr_cubit.dart';

class CustomElevatedButtonBmr extends StatelessWidget {
  const CustomElevatedButtonBmr({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/bmr_result", arguments: {
          "bmr": BlocProvider.of<BmrCubit>(context).calculateBMR(),
          "result": BlocProvider.of<BmrCubit>(context).getResult(),
          "interpretation":
              BlocProvider.of<BmrCubit>(context).getInterpretation(),
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
