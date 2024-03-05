import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());


  Future<void> getGymWorkoutExerciseData(String docId) async{
    emit(WorkoutGymLoading());
    try{
      QuerySnapshot workout=await FirebaseFirestore.instance.collection("gym_exercise").doc(docId).collection("workout").orderBy("order").get();
      List data=[];
      data.addAll(workout.docs);
      emit(WorkoutGymSuccess(data: data));
    }catch(e){
      emit(const WorkoutGymFailure(error: "Something Wrong"));

    }
  }
}
