import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeExerciseWorkoutItemViewBody extends StatelessWidget {
  const HomeExerciseWorkoutItemViewBody(
      {super.key, required this.image, required this.title, required this.des, required this.id});

  final String image, title, des, id;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CachedNetworkImage(
            imageUrl:image,
            imageBuilder: (context,imageProvider)=>
                Container(
                  height: 240,
                  decoration: BoxDecoration(image: DecorationImage(image:imageProvider,fit: BoxFit.fitWidth)),
                ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15,)),
        SliverToBoxAdapter(child: Text(title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
        const SliverToBoxAdapter(child: SizedBox(height: 10,)),
        SliverToBoxAdapter(child: Text(des,style: const TextStyle(fontSize: 18),)),
        const SliverToBoxAdapter(child: SizedBox(height: 15,)),
        const SliverToBoxAdapter(child: Text("Musle Highlight",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
        const SliverToBoxAdapter(child: SizedBox(height: 5,)),
        SliverToBoxAdapter(
          child: CachedNetworkImage(
            imageUrl:image,
            imageBuilder: (context,imageProvider)=>
                Container(
                  height: 280,
                  decoration: BoxDecoration(image: DecorationImage(image:imageProvider,fit: BoxFit.fitWidth)),
                ),
          ),
        ),

      ],

    );
  }
}
