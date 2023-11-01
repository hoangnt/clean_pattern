import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/features/home/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
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
              tileColor: Get.theme.appBarTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.buttonBorder),
              ),
              onTap: _controller.toggleTheme,
              leading: Image.asset(
                _controller.mode == AppThemeMode.light
                    ? AppAsset.sun
                    : AppAsset.moon,
                color: Get.theme.iconTheme.color,
              ),
              title: Text("${_controller.mode} theme"),
              subtitle: Text("Tap to toggle light/dark theme"),
            ),
          ],
        );
      }),
    );
  }
}
