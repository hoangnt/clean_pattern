import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConfigLoading {
  static void configLoading() {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.scale
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColor.scaffoldBackground
      ..indicatorColor = AppColor.primary
      ..textColor = AppColor.primary
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
