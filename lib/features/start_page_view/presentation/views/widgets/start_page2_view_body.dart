import 'package:flutter/material.dart';
import 'package:informa3/core/widgets/custom_button.dart';

import '../../../../../core/utils/styles.dart';
import 'age_selector.dart';

class StartPage2ViewBody extends StatelessWidget {
  const StartPage2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 30,)),
        SliverToBoxAdapter(
          child: Align(alignment: Alignment.topLeft,
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const Icon(Icons.arrow_back,)),
              )),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40,)),

        SliverToBoxAdapter(child: Center(child: Text("What's your age?",style: Styles.textStyle30(context),))),
        const SliverToBoxAdapter(child: SizedBox(height: 5,)),
        SliverToBoxAdapter(
          child: Center(
            child: Text("Select your age",style: Styles.textStyle16(context).copyWith(
                color: Colors.white60
            ),),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20,)),
        const AgeSelect(),
        const SliverToBoxAdapter(child: SizedBox(height: 140,)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(label: "CONTINUE", onTap: (){
              Navigator.pushNamed(context, "/home");


            }),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20,))

      ],
    );
  }
}
