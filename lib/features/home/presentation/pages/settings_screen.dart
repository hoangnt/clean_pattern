import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/features/home/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SettingsController>(builder: (context) {
        return Column(
          children: [
            ListTile(
              onTap: _controller.toggleTheme,
              tileColor: Get.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.buttonBorder),
              ),
              leading: Image.asset(
                _controller.mode == AppThemeMode.light
                    ? AppAsset.sun
                    : AppAsset.moon,
                color: Get.theme.iconTheme.color,
              ),
              title: Text(
                "${_controller.mode} theme".tr,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Tap to toggle light/dark theme".tr),
            ),

            ///
            ListTile(
              onTap: _controller.toggleDisplayLanguage,
              tileColor: Get.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.buttonBorder),
              ),
              leading: Image.asset(
                AppAsset.languages,
                color: Get.theme.iconTheme.color,
              ),
              title: Text(
                "Language".tr,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Choose your language".tr),
            ),
            Visibility(
              visible: _controller.displayLanguages,
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.appBarTheme.backgroundColor,
                  border: BorderDirectional(
                    bottom: BorderSide(color: AppColor.buttonBorder),
                  ),
                ),
                child: Wrap(
                  children: [
                    RadioListTile<int>.adaptive(
                      value: AppLanguage.eng,
                      groupValue: _controller.language,
                      onChanged: _controller.changeLanguage,
                      activeColor: AppColor.primary,
                      title: Text(
                        "ENG",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("English".tr),
                    ),
                    RadioListTile<int>.adaptive(
                      value: AppLanguage.vie,
                      groupValue: _controller.language,
                      onChanged: _controller.changeLanguage,
                      activeColor: AppColor.primary,
                      title: Text(
                        "VIE",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("Vietnamese".tr),
                    ),
                  ],
                ),
              ),
            ),

            ///
            ListTile(
              onTap: _controller.getLuckyNumber,
              tileColor: Get.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.buttonBorder),
              ),
              leading: Image.asset(
                AppAsset.clover,
                color: Get.theme.iconTheme.color,
              ),
              title: Text(
                "Lucky number".tr,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Tap to get lucky number".tr),
              trailing: _controller.luckyNumber != null
                  ? Text(
                      _controller.luckyNumber.toString().padLeft(2, "0"),
                      style: TextStyle(fontSize: 20.sp),
                    )
                  : null,
            ),
          ],
        );
      }),
    );
  }
}
