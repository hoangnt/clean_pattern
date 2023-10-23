import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/result_dialog.dart';
import 'package:clean_pattern/features/home/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<SettingsController>(builder: (_) {
          return Column(
            children: [
              Row(
                children: [
                  Text("LEVEL: ${_controller.level}"),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Slider(
                      activeColor: AppColor.primary,
                      inactiveColor: AppColor.primary.withOpacity(0.4),
                      max: 5,
                      divisions: 5,
                      value: _controller.level,
                      onChanged: _controller.onChangeLevel,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.dialog(ResultDialog(
                    title: "Title dialog",
                    content: "Content dialog here",
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                ),
                child: Text("dialog"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
