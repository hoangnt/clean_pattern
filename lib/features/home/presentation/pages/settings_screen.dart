import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/app_elevated_button.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set your favorite Ramen taste",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              _sliderWidget(
                text: "Salt",
                value: _controller.salt,
                onChanged: _controller.onChangeSalt,
              ),
              _sliderWidget(
                text: "Fat",
                value: _controller.fat,
                onChanged: _controller.onChangeFat,
              ),
              _sliderWidget(
                text: "Noodle's tenderness",
                value: _controller.noodleTender,
                onChanged: _controller.onChangeNoodleTender,
              ),
              brothWidget(),
              toppingListWidget(),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  onPressed: () {
                    Get.dialog(ResultDialog(
                      title: "Notice",
                      content: "Save success",
                    ));
                  },
                  text: "Save",
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget toppingListWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),
          width: 0.2.sw,
          child: Text(
            "Topping",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Wrap(
            alignment : WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              for (var item in ToppingEnum.values)
                AppElevatedButton(
                  onPressed: () => _controller.addTopping(item),
                  backgroundColor: _controller.toppingList.contains(item)
                      ? AppColor.primary
                      : AppColor.disable,
                  text: item.name,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget brothWidget() {
    return Row(
      children: [
        SizedBox(
          width: 0.2.sw,
          child: Text(
            "Broth",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var item in BrothEnum.values)
                AppElevatedButton(
                  onPressed: () => _controller.pickBroth(item),
                  backgroundColor: _controller.broth == item
                      ? AppColor.primary
                      : AppColor.disable,
                  text: item.name,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sliderWidget({
    required String text,
    required double value,
    required void Function(double)? onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 0.2.sw,
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            activeColor: AppColor.primary,
            inactiveColor: AppColor.primary.withOpacity(0.4),
            max: 5,
            divisions: 5,
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(
          "${value.toInt()}",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
