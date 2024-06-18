import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDropDownField<T> extends StatelessWidget {
  const AppDropDownField({
    required this.listOption,
    required this.onChanged,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.value,
  });

  final T? value;
  final String? hintText;
  final List<DropDownModel> listOption;
  final void Function(T?)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      borderRadius: BorderRadius.circular(10.sp),
      items: listOption.map<DropdownMenuItem<T>>((val) {
        return DropdownMenuItem<T>(
          value: val.value,
          child: Text(val.label),
        );
      }).toList(),
      onChanged: onChanged,
      icon: suffixIcon,
      decoration: InputDecoration(
        filled: true,
        fillColor: Get.theme.scaffoldBackgroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        prefixIcon: prefixIcon,
        prefixIconColor: Get.theme.iconTheme.color,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textPlaceholder,
        ),
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

class DropDownModel {
  DropDownModel({required this.label, required this.value});

  String label;
  dynamic value;
}
