import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleItemLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12.h),
      decoration: BoxDecoration(
        color: Get.theme.appBarTheme.backgroundColor,
        border: Border.all(color: AppColor.border1),
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            spreadRadius: 1.5,
            blurRadius: 4,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220.w,
            height: 17.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 120.w,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 120.w,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 1.sw,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            width: 1.sw,
            height: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 1.sw,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColor.disable.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
