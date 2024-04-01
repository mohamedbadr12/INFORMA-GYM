import 'package:flutter/material.dart';
import 'package:informa3/core/utils/size_config.dart';
abstract class Styles {
  static TextStyle textStyle18(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle20(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.normal,
      );

  static TextStyle textStyle14(context) =>
      TextStyle(
          color: Colors.white60,
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle16(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
      );
  static TextStyle textStyle25(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyle30(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w400,
      );
}

double getResponsiveFontSize( context,{required double fontSize}){
  double scaleFactor=getScaleFactor(context);
  double responsiveFontSize=fontSize * scaleFactor;
  double lowerLimit=fontSize *.8;
  double upperLimit=fontSize *1.2;
  // print("base fontSize= $fontSize lower=$lowerLimit h =$upperLimit");
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context){
  // var dispatcher=PlatformDispatcher.instance;
  // var physicalWidth=dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio=dispatcher.views.first.devicePixelRatio;
  // double width=physicalWidth/devicePixelRatio;
  double width=MediaQuery.sizeOf(context).width;

  if(width<SizeConfig.tablet){
    return width/400;
  }

  else if(width<SizeConfig.desktop) {

    return width/1000;
  }

  else {
    return width/1920;
  }
}


