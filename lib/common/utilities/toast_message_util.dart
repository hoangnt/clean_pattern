import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ToastMessageUtil {
  ToastMessageUtil._();

  static show(BuildContext context, {required String message}) {
    final snackBar = SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      backgroundColor:
          Get.theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
      margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 50.h),
      content: Row(
        children: [
          Assets.icon.mobileError.image(
            height: 25.h,
            color: Get.theme.appBarTheme.backgroundColor,
          ),
          SizedBox(width: 10.w),
          Text(
            message,
            style: AppTextStyle.w500(18.sp),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
