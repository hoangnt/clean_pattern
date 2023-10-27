import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResultDialog extends StatelessWidget {
  ResultDialog({
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
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IntrinsicHeight(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  color: AppColor.primary,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
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
      ),
    );
  }
}
