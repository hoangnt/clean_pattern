import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator(this.progress);

  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: progress != null
          ? CircularProgressIndicator(
              value: progress!,
              backgroundColor: AppColor.disable.withValues(alpha: 0.5),
              color: AppColor.primary,
            )
          : CircularProgressIndicator(
              backgroundColor: AppColor.disable.withValues(alpha: 0.5),
              color: AppColor.primary,
            ),
    );
  }
}
