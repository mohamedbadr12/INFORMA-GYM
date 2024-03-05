import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
class AgeSelect extends StatelessWidget {
  const AgeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 280.h,
      child: ListView.builder(
        itemCount: 70,
        itemBuilder: (context, index) {
          return  Container(
            height: 50.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child: Text("$index",style: Styles.textStyle20.copyWith(
                color: Colors.white60
            ),),
          );
        },
      ),
    );
  }
}

