import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmptyDataWidget extends StatelessWidget {
  AppEmptyDataWidget({
    this.text,
    this.onRefresh,
    this.height,
  });

  final String? text;
  final double? height;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.primary,
      onRefresh: onRefresh ?? () async {},
      notificationPredicate: onRefresh == null ? (_) => false : (_) => true,
      child: SizedBox(
        height: height ?? double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 0.2.sh),
                Image.asset(
                  AppAsset.empty,
                  width: 150.h,
                  color: AppColor.disable,
                ),
                Text(
                  text ?? "No data.",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.disable,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
