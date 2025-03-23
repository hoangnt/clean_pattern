import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScrollToTopButton extends StatelessWidget {
  const AppScrollToTopButton({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.animateTo(
          controller.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuint,
        );
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        margin: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primary.withValues(alpha: 0.7),
        ),
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
    );
  }
}
