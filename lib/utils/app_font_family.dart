import 'package:flutter/material.dart';

import 'app_color.dart';

class AppFontFamily {
  static String Regular = "Regular";

  static TextStyle defaultStyle({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w600,
    Color color = AppColors.primary,
  }) {
    return TextStyle(
      fontFamily: Regular,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle smallStyle16({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color color = AppColors.white,
  }) {
    return TextStyle(
      fontFamily: Regular,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle smallStyle416({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.blueLight,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle BoldStyle({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.yellow,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle BoldStyle12({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
  }) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static TextStyle HeadingStyle20({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w600,
    Color color = AppColors.primary,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle HeadingStyle32({
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w300,
    Color color = AppColors.gray,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle HeadingStyle14({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.blueLight,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle HeadingStyle618({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w600,
    Color color = AppColors.primary,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle HeadingStyle518({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w500,
    Color color = AppColors.primary,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle HeadingStyle514({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color color = AppColors.darkBlue,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle HeadingWhite414({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.white,
  }) {
    return TextStyle(
      fontFamily: AppFontFamily.Regular,
      fontSize: fontSize,
      color: color,
    );
  }
}
