import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.hintText,
    this.errorText,
    this.controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
  });

  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final void Function()? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      maxLines: maxLines,
      style: AppTextStyle.normal(16.sp),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Get.theme.scaffoldBackgroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textPlaceholder,
        ),
        errorText: errorText,
        errorStyle: AppTextStyle.normal(14.sp).copyWith(
          color: AppColor.textWarning,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.sp,
            color: AppColor.textFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.sp,
            color: AppColor.primary,
          ),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.sp,
            color: AppColor.textFieldErrorBorderColor,
          ),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.sp,
            color: AppColor.textFieldErrorFocusBorderColor,
          ),
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
    );
  }
}
