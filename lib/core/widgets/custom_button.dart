import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/constant.dart';

import '../utils/styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.label,required this.onTap});
final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap ,

      child: Container(
        width: 280.w,
        height: 50.h,
        decoration:  const BoxDecoration(boxShadow: [BoxShadow(color: kSecondaryColor,
            blurRadius:12,
            spreadRadius: 3,
            offset: Offset(3, 3))],

          borderRadius: BorderRadius.only(

            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),

          ),
          gradient: LinearGradient(colors: [
            kSecondaryColor,
            Color(0xff281537)
          ]),
        ),child: Center(child: Text(label,style: Styles.textStyle20.copyWith(color: Colors.white),)),

      ),
    );
  }
}
