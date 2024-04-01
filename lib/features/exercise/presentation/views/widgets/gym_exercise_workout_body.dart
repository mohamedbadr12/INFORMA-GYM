import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/features/exercise/presentation/manger/workout_cubit/workout_cubit.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class GymExerciseWorkoutViewBody extends StatefulWidget {
  const GymExerciseWorkoutViewBody({super.key,required this.title,required this.image,required this.documentID});
  final String image;
  final String title;
  final String documentID;

  @override
  State<GymExerciseWorkoutViewBody> createState() => _GymExerciseWorkoutViewBodyState();
}


class _GymExerciseWorkoutViewBodyState extends State<GymExerciseWorkoutViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<WorkoutCubit>(context).getGymWorkoutExerciseData(widget.documentID);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 220,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.image),
                      fit: BoxFit.fill)),
            ),
            Positioned(
                bottom: 20,
                child: Text(
                  widget.title,
                  style:Styles.textStyle22Bold(context).copyWith(
                    color: Colors.white,
                  )
                ))
          ],
        ),
        const SizedBox(
          height: 7,
        ),
         Align(
            alignment: Alignment.topLeft,
            child: Text(
              "  9 mins . 10 workouts",
              style: Styles.textStyle17Bold(context)
            )),
        BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutGymSuccess) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.table_rows_sharp,
                              color: Colors.grey,
                              size: 29,
                            )),
                        SizedBox(
                          height: 100,
                          width: 130,
                          child: CachedNetworkImage(
                            imageUrl: state.data[index]["image"],
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.data[index]["title"],
                              style: Styles.textStyle14(context).copyWith(
                                color: Colors.white
                              )
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              state.data[index]["rep"],
                              style:Styles.textStyle14(context).copyWith(
                                color: kSecondaryColor
                              )
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            } else if (state is WorkoutGymFailure) {
              return const Center(child: Text("Something Wrong"));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
