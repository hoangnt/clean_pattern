import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConfigLoading {
  static void configLoading() {
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
      ..dismissOnTap = false;
  }
}
