import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.child,
  });

  final void Function()? onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        minimumSize: Size(width ?? 55.w, height ?? 30.h),
        backgroundColor: backgroundColor ?? AppColor.primary,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
          side: const BorderSide(color: AppColor.buttonBorder),
        ),
      ),
      child: child ??
          (text != null
              ? Text(
                  text!,
                  style: AppTextStyle.normal(16.sp).copyWith(
                    color: textColor ?? Colors.white,
                  ),
                )
              : const SizedBox()),
    );
  }
}
