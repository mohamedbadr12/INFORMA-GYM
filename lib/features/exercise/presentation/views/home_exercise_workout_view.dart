import 'package:flutter/material.dart';
import 'package:informa3/features/exercise/presentation/views/widgets/home_exercise_workout_view_body.dart';

import '../../../../constant.dart';

class HomeExerciseWorkoutView extends StatelessWidget {
  const HomeExerciseWorkoutView({super.key,required this.docId,required this.title,required this.image});
 final String docId;
 final String image;
 final String title;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(title),flexibleSpace: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [kPrimaryColor,kSecondaryColor])),),),
      body: HomeExerciseWorkoutViewBody(docId: docId,image: image,title: title,),
    );
  }
}
