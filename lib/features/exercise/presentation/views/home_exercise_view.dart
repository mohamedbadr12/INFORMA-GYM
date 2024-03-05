import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/home_exercise_view_body.dart';

class HomeExerciseView extends StatelessWidget {
  const HomeExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExerciseViewBody(),
    );
  }
}
