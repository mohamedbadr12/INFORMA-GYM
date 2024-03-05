import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/widgets/show_snack.dart';
import 'package:informa3/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class AnotherAuthLogin extends StatelessWidget {
  const AnotherAuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoad=false;
    return BlocConsumer<AuthCubit,AuthState>(listener: (context, state) {
      if (state is GoogleLoading){
        isLoad=true;
      }
      if(state is GoogleSccuess){
        Navigator.pushNamedAndRemoveUntil(context, "/page1", (route) => false);
        isLoad=false;
      }
      if(state is GoogleFailure){
        showSnackBar(context, state.err);
        isLoad= false;
      }
    },
      builder:(context, state) {

      return  InkWell(
       onTap:(){
      BlocProvider.of<AuthCubit>(context).signInWithGoogle();
      },
        child: isLoad?const CircularProgressIndicator():Container(
          width: 200.w,
          height: 40.h,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.white60),
            borderRadius: BorderRadius.circular(25),

          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(
                  AssetsData.googleIcon,
                  height: 25.h,
                ),
               Text("Sign Up with google",style: Styles.textStyle14.copyWith(
                color: Colors.white60
              ),)
            ],

          ),
        ),
      );
      },

    );
  }
}