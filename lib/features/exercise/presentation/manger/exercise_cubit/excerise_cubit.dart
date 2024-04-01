import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:informa3/features/exercise/data/model/home_exercise_model.dart';
import 'package:informa3/features/exercise/data/repo/base_exercise_repo.dart';

import '../../../data/model/gym_exercise_model.dart';

part 'excerise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit({required this.homeExerciseRepo})
      : super(HomeExerciseInitial());
  final BaseHomeExerciseRepo homeExerciseRepo;

  Future<void> getHomeExerciseData() async {
    emit(HomeExerciseLoading());

    var data = await homeExerciseRepo.fetchHomeExercise();
    data.fold((failure) {
      emit(const HomeExerciseFailure(error: "Something Wrong"));
    }, (data) {
      emit(HomeExerciseSuccess(data: data));
    });
  }

  Future<void> getGymExerciseData() async {
    emit(GymExerciseLoading());

    var data = await homeExerciseRepo.fetchGymExercise();
    data.fold((failure) {
      emit( GymExerciseFailure(error: failure.toString()));
      print(failure.toString());
    }, (data) {
      emit(GymExerciseSuccess(data: data));
    });
  }
  
  
  Future<void> getHomeWorkoutExerciseData(String docId) async{
    emit(HomeWorkoutExerciseLoading());
    try{
      QuerySnapshot workout=await FirebaseFirestore.instance.collection("home_exercise").doc(docId).collection("workout").orderBy("order").get();
      List data=[];
      data.addAll(workout.docs);
      emit(HomeWorkoutExerciseSuccess(data: data));
    }catch(e){
      emit(const HomeWorkoutExerciseFailure(error: "Something Wrong"));
      
    }
  }
}
