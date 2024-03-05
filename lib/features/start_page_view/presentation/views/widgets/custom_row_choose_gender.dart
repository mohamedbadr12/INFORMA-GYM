import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class CustomRowChooseGender extends StatelessWidget {
  const CustomRowChooseGender({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 35.h,
          width:110.w,
          decoration: BoxDecoration(
            gradient:   const LinearGradient(colors: [
              kSecondaryColor,
              Color(0xff281537)
            ]),
            borderRadius: BorderRadius.circular(25),
          ),
          child:  Center(
            child: Text(
                "Male",
                style: Styles.textStyle20
            ),
          ),
        ),
        Container(
          height: 35.h,
          width:110.w,
          decoration: BoxDecoration(
            gradient:const LinearGradient(colors: [
              kSecondaryColor,
              Color(0xff281537)
            ]) ,
            borderRadius: BorderRadius.circular(25),
          ),
          child:  Center(
            child: Text(
                "Female",
                style: Styles.textStyle20
            ),
          ),
        ),
      ],)
    ;
  }
}
