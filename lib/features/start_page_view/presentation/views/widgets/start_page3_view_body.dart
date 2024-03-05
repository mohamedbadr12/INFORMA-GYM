import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';

class StartPage3ViewBody extends StatelessWidget {
  const StartPage3ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      SizedBox(height: 30.h,),
      Align(alignment: Alignment.topLeft,
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back,))),
      SizedBox(height: 25.h,),

      Center(child: Text("What's your Activity",style: Styles.textStyle30,)),
      SizedBox(height: 5.h,),
      Text("Level?",style: Styles.textStyle30
      ),
    ],

    );
  }
}
