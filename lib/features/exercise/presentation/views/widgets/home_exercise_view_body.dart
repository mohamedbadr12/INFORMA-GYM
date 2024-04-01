import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/exercise_cubit/excerise_cubit.dart';
import 'custom_container_exercise_item.dart';

class ExerciseViewBody extends StatefulWidget {
  const ExerciseViewBody({super.key});

  @override
  State<ExerciseViewBody> createState() => _ExerciseViewBodyState();
}

class _ExerciseViewBodyState extends State<ExerciseViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ExerciseCubit>(context).getHomeExerciseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<ExerciseCubit, ExerciseState>(
          buildWhen: (previous, current) {
            if(current is HomeWorkoutExerciseSuccess){
              return false;

            }
            if(current is HomeWorkoutExerciseFailure){
              return false;

            }
            if (current is HomeWorkoutExerciseLoading) {
              return false;

            }
            else{
              return true;

            }
          },
          builder: (context, state) {

            if (state is HomeExerciseSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    Navigator.pushNamed(context,"/home_workout",arguments: {
                      "docId":state.data[index].documentId,
                      "image":state.data[index].image,
                      "title":state.data[index].title
                    });
                  },
                    child: CustomContainerExerciseItem(
                      title: state.data[index].title,
                      imageUrl: state.data[index].image,
                      rep: state.data[index].rep ,
                    ),
                  );
                },
              );
            } else if (state is HomeExerciseFailure) {
              return const Center(child: Text("Something Wrong"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
