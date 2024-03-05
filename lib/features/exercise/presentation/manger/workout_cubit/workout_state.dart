part of 'workout_cubit.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
  @override
  List<Object> get props => [];

}

class WorkoutInitial extends WorkoutState {
}
class WorkoutGymLoading extends WorkoutState {
}
class WorkoutGymFailure extends WorkoutState {
 final String error;

  const WorkoutGymFailure({required this.error});
}
class WorkoutGymSuccess extends WorkoutState {
  final List data;

  const WorkoutGymSuccess({required this.data});
}
