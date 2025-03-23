import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle w100([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
      );

  static TextStyle w200([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );

  static TextStyle w300([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );

  // normal = w400
  static TextStyle normal([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  static TextStyle w500([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  static TextStyle w600([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  // bold = w700
  static TextStyle w700([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );

  static TextStyle w800([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

  static TextStyle w900([double? fontSize]) => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      );
}

extension AppTextColor on TextStyle {
  TextStyle get primaryColor => copyWith(color: AppColor.primary);
  TextStyle get black => copyWith(color: Colors.black);
  TextStyle get white => copyWith(color: Colors.white);
}
