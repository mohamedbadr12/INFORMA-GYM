import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    BlocProvider.of<ExceriseCubit>(context).getHomeWorkoutExerciseData(
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
              height: 220.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.image),
                      fit: BoxFit.fill)),
            ),
            Positioned(
                bottom: 20,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.spMin,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              "  9 mins . 10 workouts",
              style: TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.bold),
            )),
        BlocBuilder<ExceriseCubit, ExceriseState>(
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
                          height: 100.h,
                          width: 130.w,
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
                              style: TextStyle(
                                  fontSize: 14.spMin,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              state.data[index]["rep"],
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 14.spMin,
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
