import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/features/flavor/presentation/controller/flavor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FlavorScreen extends StatelessWidget {
  final _controller = Get.find<FlavorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            GetBuilder<FlavorController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Set your favorite Ramen taste".tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _sliderWidget(
                    text: "Salt".tr,
                    value: _controller.salt,
                    onChanged: _controller.onChangeSalt,
                    labels: [
                      "none",
                      "light",
                      "normal",
                      "heavy",
                      "extra heavy",
                      "hyper",
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _sliderWidget(
                    text: "Fat".tr,
                    value: _controller.fat,
                    onChanged: _controller.onChangeFat,
                    labels: [
                      "none",
                      "light",
                      "medium",
                      "rich",
                      "ultra rich",
                      "hyper",
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _sliderWidget(
                    text: "Noodle's tenderness".tr,
                    value: _controller.noodleTenderness,
                    onChanged: _controller.onChangeNoodleTender,
                    labels: [
                      "extra firm",
                      "firm",
                      "normal",
                      "soft",
                      "extra soft",
                      "hyper",
                    ],
                  ),
                  brothWidget(),
                  toppingListWidget(),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      onPressed: () async {
                        if (await _controller.saveRamenFlavor()) {
                          Get.dialog(ResultDialog(
                            title: "Notice",
                            content: "Save success",
                          ));
                          return;
                        }

                        Get.dialog(ResultDialog(
                          title: "Notice",
                          content: "Save failure",
                        ));
                      },
                      text: "Save".tr,
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => Text(
                    _controller.hour.toString().padLeft(2, "0"),
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(":", style: TextStyle(fontSize: 16.sp)),
                Obx(
                  () => Text(
                    _controller.min.toString().padLeft(2, "0"),
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(":", style: TextStyle(fontSize: 16.sp)),
                Obx(
                  () => Text(
                    _controller.sec.toString().padLeft(2, "0"),
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget toppingListWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Text(
              "Topping".tr,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          flex: 5,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
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
        Expanded(
          child: Text(
            "Broth".tr,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var item in BrothEnum.values)
                AppElevatedButton(
                  onPressed: () => _controller.pickBroth(item),
                  backgroundColor: _controller.broth == item
                      ? AppColor.primary
                      : AppColor.disable,
                  text: item.name.tr,
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
    List<String>? labels,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Slider.adaptive(
            activeColor: AppColor.primary,
            inactiveColor: AppColor.primary.withOpacity(0.4),
            label: labels != null ? labels[value.toInt()] : null,
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
