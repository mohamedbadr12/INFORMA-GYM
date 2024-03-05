import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseRequest{
  Future<QuerySnapshot<Map<String, dynamic>>> getHomeExerciseRawData()async{
   return await FirebaseFirestore.instance.collection("home_exercise").orderBy("order").get();

  }

  Future<QuerySnapshot<Map<String, dynamic>>> getGymExerciseRawData()async{
    return await FirebaseFirestore.instance.collection("gym_exercise").orderBy("order").get();

  }

}