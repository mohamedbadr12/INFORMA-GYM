import 'package:flutter/material.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/core/utils/assets.dart';

import 'custom_choose_exercise_container.dart';

class ChooseWorkoutViewBody extends StatelessWidget {
  const ChooseWorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CustomChooseExerciseContainer(name:"Home",image: AssetsData.chooseHomeExercise,)
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "V",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            ".S",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: kSecondaryColor),
          ),
        ],
      ),
       Expanded(
        child: CustomChooseExerciseContainer(image: AssetsData.chooseGymExercise,name: "GYM",)
      )
    ]);
  }
}
