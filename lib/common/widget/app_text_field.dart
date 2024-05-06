import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
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
      style: AppTextStyle.normal(16.sp),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
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
