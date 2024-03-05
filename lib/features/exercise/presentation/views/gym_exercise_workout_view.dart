import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/gym_exercise_workout_body.dart';

class GymExerciseWorkoutView extends StatelessWidget {
  const GymExerciseWorkoutView({super.key,required this.documentID,required this.title,required this.image});
final String title;
final String documentID;
final String image;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GymExerciseWorkoutViewBody(image:image ,documentID:documentID ,title:title ) ,
    );
  }
}
