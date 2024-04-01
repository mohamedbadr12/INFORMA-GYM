import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class StartPage3ViewBody extends StatelessWidget {
  const StartPage3ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      const SizedBox(height: 30,),
      Align(alignment: Alignment.topLeft,
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back,))),
      const SizedBox(height: 25,),

      Center(child: Text("What's your Activity",style: Styles.textStyle30(context),)),
      const SizedBox(height: 5,),
      Text("Level?",style: Styles.textStyle30(context)
      ),
    ],

    );
  }
}
