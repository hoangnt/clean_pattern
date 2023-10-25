import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    this.onPressed,
    required this.text,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(45.w, 25.h),
        backgroundColor: backgroundColor ?? AppColor.primary,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      child: Text(text),
    );
  }
}
