import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    required this.title,
    required this.content,
    this.closeTitle,
  });

  final String title;
  final String? closeTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                color: AppColor.primary,
                width: double.infinity,
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyle.w500(16.sp).white,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  content,
                  style: AppTextStyle.normal(14.sp),
                ),
              ),
              SizedBox(height: 5.h),
              AppElevatedButton(
                onPressed: Get.back,
                text: closeTitle ?? "Close",
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
