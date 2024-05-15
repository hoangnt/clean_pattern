import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownMenu<T> extends StatelessWidget {
  AppDropdownMenu({
    required this.listOption,
    this.initialSelection,
    this.controller,
    this.onSelected,
    this.errorText,
    this.hintText,
    this.trailingIcon,
    this.leadingIcon,
    this.enableSearch = false,
    this.height,
    this.width,
  });

  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final T? initialSelection;
  final List<T> listOption;
  final void Function(T?)? onSelected;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final bool enableSearch;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      initialSelection: initialSelection,
      controller: controller,
      onSelected: onSelected,
      width: width ?? 150.w,
      enableFilter: true,
      enableSearch: false,
      requestFocusOnTap: enableSearch,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon ??
          Transform.translate(
            offset: Offset(3, -5),
            child: trailingIcon ?? Icon(Icons.keyboard_arrow_down_rounded),
          ),
      menuStyle: MenuStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      dropdownMenuEntries: listOption
          .map(
            (val) => DropdownMenuEntry<T>(
              value: val,
              label: val.toString(),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.black26),
              ),
            ),
          )
          .toList(),
      textStyle: AppTextStyle.normal(16.sp),
      hintText: hintText,
      errorText: errorText,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        constraints: BoxConstraints.tight(
          Size.fromHeight(height ?? 35.h),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        hintStyle: TextStyle(
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
