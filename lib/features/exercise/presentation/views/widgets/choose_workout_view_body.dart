import 'package:flutter/material.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/core/utils/assets.dart';
import 'package:informa3/core/utils/styles.dart';

import 'custom_choose_exercise_container.dart';

class ChooseWorkoutViewBody extends StatelessWidget {
  const ChooseWorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: InkWell(onTap: (){
          Navigator.pushNamed(context, "/exercise");
        },
            child: CustomChooseExerciseContainer(name:"Home",image: AssetsData.chooseHomeExercise,))
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "V",
            style: Styles.textStyle35(context)
          ),
          Text(
            ".S",
            style: Styles.textStyle35(context).copyWith(
              color: kSecondaryColor
            )
          ),
        ],
      ),
       Expanded(
        child: InkWell(onTap: (){
          Navigator.pushNamed(context, "/gym_exercise");
        },
            child: CustomChooseExerciseContainer(image: AssetsData.chooseGymExercise,name: "GYM",))
      )
    ]);
  }
}
