import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
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
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
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
                child ?? const SizedBox(),
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
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
