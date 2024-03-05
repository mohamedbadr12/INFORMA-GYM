part of 'excerise_cubit.dart';

abstract class ExceriseState extends Equatable {
  const ExceriseState();
  @override
  List<Object> get props => [];
}

class HomeExceriseInitial extends ExceriseState {}
class HomeExceriseLoading extends ExceriseState {}
class HomeExceriseSuccess extends ExceriseState {
  final List <HomeExerciseModel>data;

  const HomeExceriseSuccess({required this.data});
}
class HomeExceriseFailure extends ExceriseState {
  final String error;

  const HomeExceriseFailure( {required this.error});
}
class GymExerciseLoading extends ExceriseState {}

class GymExerciseSuccess extends ExceriseState {
  final List<GymExerciseModel>data;

  const GymExerciseSuccess({required this.data});
}
class GymExerciseFailure extends ExceriseState {
  final String error;

  const GymExerciseFailure( {required this.error});
}

class HomeWorkoutExerciseLoading extends ExceriseState {}
class HomeWorkoutExerciseSuccess extends ExceriseState {
 final List data;
  const HomeWorkoutExerciseSuccess({required this.data});
}
class HomeWorkoutExerciseFailure extends ExceriseState {
  final String error;
  const HomeWorkoutExerciseFailure( {required this.error});
}

