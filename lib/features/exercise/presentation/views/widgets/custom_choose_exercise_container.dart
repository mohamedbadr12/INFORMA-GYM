import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomChooseExerciseContainer extends StatelessWidget {
  const CustomChooseExerciseContainer({super.key,required this.image,required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[ Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              )),
        ),
          Positioned(top:20,
            left: 5,
            child: Text("$name\n  WORKOUT",style: Styles.textStyle25(context)),
          )
        ]
    );
  }
}
