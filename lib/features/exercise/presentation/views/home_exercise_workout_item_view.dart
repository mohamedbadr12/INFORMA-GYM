import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/home_exercise_workout_item_view_body.dart';

class HomeExerciseWorkoutItemView extends StatelessWidget {
  const HomeExerciseWorkoutItemView(
      {super.key,
      required this.title,
      required this.image,
      required this.des,
      required this.id});

  final String title, image, des, id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeExerciseWorkoutItemViewBody(
          title: title, image: image, des: des, id: id),
    );
  }
}
