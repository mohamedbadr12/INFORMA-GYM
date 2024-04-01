import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/home_exercise_view_body.dart';

import '../../../../constant.dart';

class HomeExerciseView extends StatelessWidget {
  const HomeExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("INFORMA"),flexibleSpace: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [kPrimaryColor,kSecondaryColor])),),),
      body: const ExerciseViewBody(),
    );
  }
}
