import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/features/exercise/presentation/views/home_exercise_workout_view.dart';

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
    BlocProvider.of<ExceriseCubit>(context).getHomeExerciseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: BlocBuilder<ExceriseCubit, ExceriseState>(
          builder: (context, state) {
            if (state is HomeExceriseSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    Navigator.pushNamed(context,"/home_workout",arguments: {
                      "docId":state.data[index].documentId,
                      "image":state.data[index].image,
                      "title":state.data[index].title
                    });        // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeExerciseWorkoutView(
                    //   docId:state.data[index].documentId,
                    // ),
                    // ));
                  },
                    child: CustomContainerExerciseItem(
                      title: state.data[index].title,
                      imageUrl: state.data[index].image,
                      rep: state.data[index].rep ,
                    ),
                  );
                },
              );
            } else if (state is HomeExceriseFailure) {
              return const Center(child: Text("Something Wrong"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

// Align(
//     alignment: Alignment.topLeft,
//     child: Text(
//       "7x4 CHALLENGE",
//       style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.white),
//     )),
// SizedBox(
//   height: 10,
// ),
