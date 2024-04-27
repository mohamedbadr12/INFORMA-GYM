import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/constant.dart';
import 'package:informa3/core/utils/styles.dart';
import 'package:informa3/features/exercise/presentation/manger/exercise_cubit/excerise_cubit.dart';

class HomeExerciseWorkoutViewBody extends StatefulWidget {
  const HomeExerciseWorkoutViewBody(
      {super.key,
      required this.docId,
      required this.image,
      required this.title});

  final String docId;
  final String title;
  final String image;

  @override
  State<HomeExerciseWorkoutViewBody> createState() =>
      _HomeExerciseWorkoutViewBodyState();
}

class _HomeExerciseWorkoutViewBodyState
    extends State<HomeExerciseWorkoutViewBody> {
  @override
  void initState() {
    BlocProvider.of<ExerciseCubit>(context).getHomeWorkoutExerciseData(
      widget.docId,
    );
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.image),
                      fit: BoxFit.fill)),
            ),
            Positioned(
                bottom: 20,
                child: Text(widget.title,
                    style: Styles.textStyle22Bold(context)
                        .copyWith(color: Colors.white)))
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text("  9 mins . 10 workouts",
                style: Styles.textStyle17Bold(context))),
        BlocBuilder<ExerciseCubit, ExerciseState>(
          buildWhen: (previous, current) {
            if (current is HomeExerciseLoading) {
              return false;
            }
            if (current is HomeExerciseFailure) {
              return false;
            }
            if (current is HomeExerciseSuccess) {
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            if (state is HomeWorkoutExerciseSuccess) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/home_workout_item",
                            arguments: {
                              "docId": state.data[index]["documentId"],
                              "image": state.data[index]["image"],
                              "title": state.data[index]["title"],
                              "rep": state.data[index]["rep"],
                            });
                      },
                      child: Row(
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
                              Text(state.data[index]["title"],
                                  style: Styles.textStyle14(context).copyWith(
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(state.data[index]["rep"],
                                  style: Styles.textStyle14(context).copyWith(
                                    color: kSecondaryColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is HomeWorkoutExerciseFailure) {
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
