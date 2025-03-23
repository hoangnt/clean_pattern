import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConfigLoading {
  static void light() {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = AppColor.primary
      ..textColor = AppColor.primary
      ..userInteractions = false
      ..fontSize = 15
      ..indicatorSize = 24
      ..boxShadow = [
        BoxShadow(
          color: AppColor.primary.withValues(alpha: 0.2),
          blurRadius: 2,
          spreadRadius: 4,
        ),
      ]
      ..dismissOnTap = false;
  }

  static void dark() {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColor.appBarBackground
      ..indicatorColor = AppColor.primary
      ..textColor = AppColor.primary
      ..userInteractions = false
      ..fontSize = 15
      ..indicatorSize = 24
      ..boxShadow = [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.2),
          blurRadius: 2,
          spreadRadius: 4,
        ),
      ]
      ..dismissOnTap = false;
  }
}
