import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerExerciseItem extends StatelessWidget {
  const CustomContainerExerciseItem({super.key,required this.imageUrl,required this.title,required this.rep});
  final String imageUrl;
  final String title;
  final String rep;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topLeft,
      children: [


  Container(margin: EdgeInsets.symmetric(vertical: 7.h),
    child: ClipRRect(borderRadius: BorderRadius.circular(25),
      child: AspectRatio(
      aspectRatio:9/4 ,
      child:CachedNetworkImage(
      imageUrl: imageUrl,fit: BoxFit.fitWidth,
      )
      )),
  ),

        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 10.h),
        //   height: 140.h,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(25),
        //       color: Colors.transparent,
        //       image:  DecorationImage(
        //           image: NetworkImage(imageUrl),
        //           fit: BoxFit.fitWidth)),
        // ),

        Positioned(
            top: 40,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 70,
            left: 10,
            child: Text(rep
              ,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}