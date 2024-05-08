import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeMode {
  static const String light = "Light";
  static const String dark = "Dark";
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Dosis",
    primaryColor: AppColor.primary,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColor.primary,
      secondary: AppColor.primaryLight,
    ),
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
    primaryColor: AppColor.primary,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColor.primary,
      secondary: AppColor.primaryLight,
    ),
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
