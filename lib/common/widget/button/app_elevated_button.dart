import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.child,
  });

  final void Function()? onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        minimumSize: Size(45.w, 25.h),
        backgroundColor: backgroundColor ?? AppColor.primary,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
          side: BorderSide(color: AppColor.buttonBorder),
        ),
      ),
      child: child ?? (text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: textColor,
                  ),
                )
              : SizedBox()),
    );
  }
}
