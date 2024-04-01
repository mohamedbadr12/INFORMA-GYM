import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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


  Container(margin: const EdgeInsets.symmetric(vertical: 7),
    child: ClipRRect(borderRadius: BorderRadius.circular(25),
      child: AspectRatio(
      aspectRatio:9/4 ,
      child:CachedNetworkImage(
      imageUrl: imageUrl,fit: BoxFit.fitWidth,
      )
      )),
  ),



        Positioned(
            top: 40,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 70,
            left: 10,
            child: Text(rep
              ,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}