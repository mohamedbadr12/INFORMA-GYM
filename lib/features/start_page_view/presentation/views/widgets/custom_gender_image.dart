import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class CustomGenderSelectImage extends StatelessWidget {
  const CustomGenderSelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(padding: EdgeInsets.only(right: 20.w,left: 20.w),
      child: SizedBox(height: 370.h,

        child: Image.asset(AssetsData.page1Image,),
      ),

    );

  }
}