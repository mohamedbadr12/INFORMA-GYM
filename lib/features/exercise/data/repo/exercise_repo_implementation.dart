import 'package:dartz/dartz.dart';
import 'package:informa3/core/errors/failure.dart';
import 'package:informa3/features/exercise/data/repo/base_exercise_repo.dart';

import '../data_source/exercise/raw_exercise.dart';
import '../model/gym_exercise_model.dart';
import '../model/home_exercise_model.dart';

class HomeExerciseImp implements BaseHomeExerciseRepo{
 final ExerciseRequest exerciseRequest;

 HomeExerciseImp(this.exerciseRequest);

  @override
  Future<Either<Failures, List<HomeExerciseModel>>> fetchHomeExercise() async{

   try{
     var exercise=await exerciseRequest.getHomeExerciseRawData();
     var homeData= exercise.docs.map((e) => HomeExerciseModel.fromDocumentSnapshot(e)).toList();
     return right(homeData);
   }
catch(e){
     return left(ServerFailure("Something Wrong"));
}
  }

  @override
  Future<Either<Failures, List<GymExerciseModel>>> fetchGymExercise()async {
     try{
      var exercise=await exerciseRequest.getGymExerciseRawData();
       var homeData= exercise.docs.map((e) => GymExerciseModel.fromDocumentSnapshot(e)).toList();
       return right(homeData);
     }
     catch(e){
       return left(ServerFailure("Something Wrong"));
     }
   }

}