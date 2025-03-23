import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    this.text,
    required this.value,
    required this.onChanged,
  });

  final String? text;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 150),
            crossFadeState:
                value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Icon(
              Icons.check_box,
              size: 24.sp,
              color: AppColor.primary,
            ),
            secondChild: Icon(
              Icons.check_box_outline_blank,
              size: 24.sp,
              color: AppColor.disable,
            ),
          ),
          if (text != null && text!.isNotEmpty) SizedBox(width: 3.w),
          if (text != null && text!.isNotEmpty)
            Text(
              text!,
              style: AppTextStyle.normal(16.sp),
            ),
        ],
      ),
    );
  }
}
