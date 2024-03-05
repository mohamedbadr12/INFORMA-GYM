import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/gym_exercise_model.dart';
import '../model/home_exercise_model.dart';

abstract class BaseHomeExerciseRepo{

  Future<Either<Failures,List<HomeExerciseModel>>> fetchHomeExercise();
  Future<Either<Failures,List<GymExerciseModel>>> fetchGymExercise();
}