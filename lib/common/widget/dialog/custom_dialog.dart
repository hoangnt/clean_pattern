import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    required this.title,
    this.closeTitle,
    this.actionTitle,
    this.child,
    this.onAction,
    this.disableActionButton = false,
    this.disableCloseButton = false,
  });

  final String title;
  final String? closeTitle;
  final String? actionTitle;
  final void Function()? onAction;
  final Widget? child;

  final bool disableCloseButton;
  final bool disableActionButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  child ?? SizedBox(),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!disableActionButton)
                        AppElevatedButton(
                          onPressed: onAction,
                          text: actionTitle ?? "Confirm".tr,
                        ),
                      if (!disableCloseButton)
                        AppElevatedButton(
                          onPressed: Get.back,
                          text: closeTitle ?? "Close".tr,
                          backgroundColor: Get.theme.scaffoldBackgroundColor,
                          textColor: Get.theme.textTheme.bodyMedium!.color,
                        ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
