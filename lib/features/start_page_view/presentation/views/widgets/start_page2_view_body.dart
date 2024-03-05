import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/widgets/custom_button.dart';

import '../../../../../core/utils/styles.dart';
import 'age_selector.dart';

class StartPage2ViewBody extends StatelessWidget {
  const StartPage2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30.h,),
        Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const Icon(Icons.arrow_back,))),
        SizedBox(height: 40.h,),

        Center(child: Text("What's your age?",style: Styles.textStyle30,)),
        SizedBox(height: 5.h,),
        Text("Select your age",style: Styles.textStyle16.copyWith(
            color: Colors.white60
        ),),
        SizedBox(height: 20.h,),
        const AgeSelect(),
        SizedBox(height: 140.h,),

        CustomButton(label: "CONTINUE", onTap: (){
          Navigator.pushNamed(context, "/home");


        })



      ],
    );
  }
}
