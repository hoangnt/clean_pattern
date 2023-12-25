import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScrollToTopButton extends StatelessWidget {
  AppScrollToTopButton({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.animateTo(
          controller.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutQuint,
        );
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primary.withOpacity(0.7),
        ),
        child: Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
    );
  }
}
