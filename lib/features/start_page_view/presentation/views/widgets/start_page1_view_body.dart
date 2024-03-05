import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/utils/styles.dart';
import 'package:informa3/core/widgets/custom_button.dart';
import 'custom_gender_image.dart';
import 'custom_row_choose_gender.dart';

class StartPage1ViewBody extends StatelessWidget {
  const StartPage1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(crossAxisAlignment: CrossAxisAlignment.center
      ,
      children: [
        SizedBox(height: 80.h,),
        Center(child: Text("Male or Female?",style: Styles.textStyle30,)),
        SizedBox(height: 5.h,),
        Text("Select your gender",style: Styles.textStyle16.copyWith(
          color: Colors.white60
        ),),

        const CustomGenderSelectImage(),
        const CustomRowChooseGender(),
        SizedBox(height: 80.h,),
        CustomButton(label: "CONTINUE", onTap: (){
          Navigator.pushNamed(context, "/page2");
        })
      ],


    );
  }
}




