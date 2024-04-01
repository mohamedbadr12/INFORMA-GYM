import 'package:flutter/material.dart';
import 'package:informa3/core/utils/styles.dart';
import 'package:informa3/core/widgets/custom_button.dart';
import '../../../../../core/widgets/show_snack.dart';
import 'custom_gender_image.dart';
import 'custom_row_choose_gender.dart';

class StartPage1ViewBody extends StatelessWidget {
  const StartPage1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    int currentGender=-1;
    return  CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 80,)),
        SliverToBoxAdapter(child: Center(child: Text("Male or Female?",style: Styles.textStyle30(context),))),
       const SliverToBoxAdapter(child: SizedBox(height: 10,)),
        SliverToBoxAdapter(
          child: Center(
            child: Text("Select your gender",style: Styles.textStyle16(context).copyWith(
              color: Colors.white60
            ),),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30,)),
        const SliverToBoxAdapter(child: CustomGenderSelectImage()),
        SliverToBoxAdapter(child: CustomRowChooseGender(onIndexChanged: (currentIndex)=>currentGender=currentIndex,)),
        const SliverToBoxAdapter(child: SizedBox(height: 80,)),
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(label: "CONTINUE", onTap: (){
              if(currentGender!=-1){
                Navigator.pushNamed(context, "/page2");
              }else{
                showSnackBar(context, "Please choose your gender");
              }

            }),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20,)),

      ],


    );
  }
}




