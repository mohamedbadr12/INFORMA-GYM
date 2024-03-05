import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/utils/assets.dart';
import 'package:informa3/features/auth/presentation/views/widgets/custom_container_sign_up.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(AssetsData.signUPImage,fit: BoxFit.cover,height: 220.h,),
        Padding(padding: EdgeInsets.only(top: 205.h),
            child: const CustomContainerSignUp())
      ],

    );
  }
}

