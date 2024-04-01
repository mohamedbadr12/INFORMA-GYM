import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:informa3/constant.dart';
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
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "  9 mins . 10 workouts",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
        BlocBuilder<ExerciseCubit, ExerciseState>(
          buildWhen: (previous, current) {
          if(current is HomeExerciseLoading){
            return false;
          }if(current is HomeExerciseFailure){
            return false;
          }if(current is HomeExerciseSuccess){
            return false;

          }
          else{
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
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              state.data[index]["rep"],
                              style: const TextStyle(
                                color: kSecondaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
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
