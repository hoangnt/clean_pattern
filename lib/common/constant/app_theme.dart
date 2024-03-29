import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeMode {
  static const String light = "Light";
  static const String dark = "Dark";
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Dosis",
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noThumb,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: "Dosis-Medium",
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.sp,
      ),
      iconTheme: IconThemeData(color: Colors.black, size: 22.sp),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Dosis",
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundDark,
    dialogTheme: DialogTheme(
      backgroundColor: AppColor.scaffoldBackgroundDark,
    ),
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noThumb,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.appBarBackground,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.appBarBackground,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleSpacing: 0,
      backgroundColor: AppColor.appBarBackground,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: "Dosis-Medium",
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.sp,
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 22.sp),
    ),
  );
}
