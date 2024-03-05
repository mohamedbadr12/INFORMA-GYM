import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/home_exercise_workout_view_body.dart';

class HomeExerciseWorkoutView extends StatelessWidget {
  const HomeExerciseWorkoutView({super.key,required this.docId,required this.title,required this.image});
 final String docId;
 final String image;
 final String title;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeExerciseWorkoutViewBody(docId: docId,image: image,title: title,),
    );
  }
}
