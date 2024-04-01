import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/exercise_cubit/excerise_cubit.dart';
import 'custom_container_exercise_item.dart';

class GymExerciseViewBody extends StatefulWidget {
  const GymExerciseViewBody({super.key});

  @override
  State<GymExerciseViewBody> createState() => _GymExerciseViewBodyState();
}

class _GymExerciseViewBodyState extends State<GymExerciseViewBody> {
  @override
  void initState() {
    BlocProvider.of<ExerciseCubit>(context).getGymExerciseData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<ExerciseCubit, ExerciseState>(
          builder: (context, state) {
            if (state is GymExerciseSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    Navigator.pushNamed(context,"/gym_workout",arguments: {
                      "docId":state.data[index].documentId,
                      "image":state.data[index].image,
                      "title":state.data[index].title
                    });
                  },
                    child: CustomContainerExerciseItem(
                      title: state.data[index].title,
                      imageUrl: state.data[index].image,
                      rep: "",
                    ),
                  );
                },
              );
            } else if (state is GymExerciseFailure) {
              return  Center(child: Text("Something Wrong ${state.error}"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
