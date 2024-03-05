import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:informa3/core/utils/assets.dart';
import 'custom_container_auth.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Image.asset(AssetsData.loginImage,fit: BoxFit.cover,height: 260.h),
              Padding(padding: EdgeInsets.only(top: 220.h),
                child: const CustomContainerAuth())
      ],

     );


  }
}
