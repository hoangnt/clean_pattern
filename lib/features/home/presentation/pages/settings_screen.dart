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
                      max: 5,
                      divisions: 5,
                      value: _controller.level,
                      onChanged: _controller.onChangeLevel,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
