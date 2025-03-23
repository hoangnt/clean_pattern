import 'package:clean_pattern/common/core_ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleItemLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 12.h),
      decoration: BoxDecoration(
        color: Get.theme.appBarTheme.backgroundColor,
        border: Border.all(color: AppColor.border1),
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            spreadRadius: 1.5,
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedLine(
            beginWidth: 220.w,
            endWidth: 270.w,
            height: 17.h,
          ),
          SizedBox(height: 5.h),
          AnimatedLine(
            millisecondsDelay: 150,
            beginWidth: 120.w,
            endWidth: 150.w,
            height: 17.h,
          ),
          SizedBox(height: 5.h),
          AnimatedLine(
            millisecondsDelay: 200,
            beginWidth: 120.w,
            endWidth: 150.w,
            height: 17.h,
          ),
          SizedBox(height: 5.h),
          AnimatedLine(
            millisecondsDelay: 300,
            beginWidth: 0.65.sw,
            endWidth: 0.85.sw,
            height: 10.h,
          ),
          SizedBox(height: 2.h),
          AnimatedLine(
            millisecondsDelay: 400,
            beginWidth: 0.65.sw,
            endWidth: 0.85.sw,
            height: 10.h,
          ),
          SizedBox(height: 5.h),
          Container(
            width: 1.sw,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColor.disable.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLine extends StatefulWidget {
  const AnimatedLine({
    required this.beginWidth,
    required this.endWidth,
    this.height = 10,
    this.millisecondsDelay = 0,
  });

  final double beginWidth;
  final double endWidth;
  final double height;
  final int millisecondsDelay;

  @override
  AnimatedLineState createState() => AnimatedLineState();
}

class AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    Tween<double> tween =
        Tween<double>(begin: widget.beginWidth, end: widget.endWidth);
    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(
      Duration(milliseconds: widget.millisecondsDelay),
      () => controller.repeat(reverse: true),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: animation.value,
      height: 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColor.disable.withValues(alpha: 0.4),
      ),
    );
  }
}
