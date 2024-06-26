import 'package:flutter/material.dart';
import 'package:informa3/core/utils/size_config.dart';

abstract class Styles {
  static TextStyle textStyle12Bold(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.bold,
      );

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

  static TextStyle textStyle17Bold(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 17),
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyle22Bold(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyle25(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyle28Bold(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyle30(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w400,
      );

  static TextStyle textStyle35(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 35),
        fontWeight: FontWeight.w700,
      );

  ///BMR styles
  static TextStyle kLabelTextStyle18(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: const Color(0xFF8D8E98),

      );

  static TextStyle kNumberTextStyle50(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 50),
        color: Colors.white60,
        fontWeight: FontWeight.w900,

      );

  static TextStyle kLargerButtonTextStyle25(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 25),
        fontWeight: FontWeight.bold,

      );

  static TextStyle kTitleTextStyle50(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 50),
        fontWeight: FontWeight.bold,
        color: Colors.white60,
      );

  static TextStyle kResultTextStyle22(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.bold,
        color: const Color(0xFF24D876),
      );

  static TextStyle kBMRTextStyle100(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 100),
        fontWeight: FontWeight.bold,
        color: Colors.white60,
      );

  static TextStyle kBodyTextStyle22(context) =>
      TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),

      );


}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  // print("base fontSize= $fontSize lower=$lowerLimit h =$upperLimit");
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery
      .sizeOf(context)
      .width;
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
