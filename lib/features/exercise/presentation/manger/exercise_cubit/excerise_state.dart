part of 'excerise_cubit.dart';

abstract class ExerciseState extends Equatable {
  const ExerciseState();
  @override
  List<Object> get props => [];
}

class HomeExerciseInitial extends ExerciseState {}
class HomeExerciseLoading extends ExerciseState {}
class HomeExerciseSuccess extends ExerciseState {
  final List <HomeExerciseModel>data;

  const HomeExerciseSuccess({required this.data});
}
class HomeExerciseFailure extends ExerciseState {
  final String error;

  const HomeExerciseFailure( {required this.error});
}
class GymExerciseLoading extends ExerciseState {}

class GymExerciseSuccess extends ExerciseState {
  final List<GymExerciseModel>data;

  const GymExerciseSuccess({required this.data});
}
class GymExerciseFailure extends ExerciseState {
  final String error;

  const GymExerciseFailure( {required this.error});
}

class HomeWorkoutExerciseLoading extends ExerciseState {}
class HomeWorkoutExerciseSuccess extends ExerciseState {
 final List data;
  const HomeWorkoutExerciseSuccess({required this.data});
}
class HomeWorkoutExerciseFailure extends ExerciseState {
  final String error;
  const HomeWorkoutExerciseFailure( {required this.error});
}

