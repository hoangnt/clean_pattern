import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/extensions/datetime_extension.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/customer/presentation/controller/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerScreen extends StatelessWidget {
  final _controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CustomerController>(builder: (context) {
        return Column(
          children: [
            _userInforWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Set your favorite Ramen taste".tr,
                        style: AppTextStyle.w700(16.sp),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          _controller.hour.toString().padLeft(2, "0"),
                          style: AppTextStyle.w700(16.sp),
                        ),
                      ),
                      Text(":", style: AppTextStyle.normal(16.sp)),
                      Obx(
                        () => Text(
                          _controller.min.toString().padLeft(2, "0"),
                          style: AppTextStyle.w700(16.sp),
                        ),
                      ),
                      Text(":", style: AppTextStyle.normal(16.sp)),
                      Obx(
                        () => Text(
                          _controller.sec.toString().padLeft(2, "0"),
                          style: AppTextStyle.w700(16.sp),
                        ),
                      ),
                    ],
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
                  SizedBox(height: 14.h),
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
                  SizedBox(height: 14.h),
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
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      onPressed: () async {
                        if (await _controller.saveRamenFlavor()) {
                          Get.dialog(const ResultDialog(
                            title: "Notice",
                            content: "Save flavor success",
                          ));
                          return;
                        }

                        Get.dialog(const ResultDialog(
                          title: "Notice",
                          content: "Save flavor failure",
                        ));
                      },
                      text: "Save".tr,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.customerServices),
                      child: Text(
                        "Help ?".tr,
                        style: AppTextStyle.normal(16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _userInforWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.appBarTheme.backgroundColor,
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.userInfo?.avatarUrl != null
                  ? CachedNetworkImage(
                      imageUrl: _controller.userInfo!.avatarUrl!,
                      errorWidget: (context, _, __) => const Center(
                        child: Icon(Icons.error),
                      ),
                      progressIndicatorBuilder: (_, __, progress) => Container(
                        width: 90.w,
                        height: 90.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Get.theme.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: AppProgressIndicator(progress.progress),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        width: 90.w,
                        height: 90.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      width: 90.w,
                      height: 90.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: AppColor.disable,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person_3_outlined, size: 35.w),
                    ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _controller.userInfo?.name ?? "",
                    style: AppTextStyle.w600(22.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _controller.userInfo?.birthday != null
                        ? _controller.userInfo!.birthday!.toDDMMYYYYString
                        : "",
                    style: AppTextStyle.w600(16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _controller.userInfo?.email ?? "",
                    style: AppTextStyle.w600(16.sp).copyWith(
                      color: AppColor.textColor1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.editUserInfo),
            child: Icon(Icons.edit, size: 22.sp),
          ),
        ],
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
              style: AppTextStyle.w500(14.sp),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          flex: 6,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: -10.h,
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
            style: AppTextStyle.w500(14.sp),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          flex: 6,
          child: Row(
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
            style: AppTextStyle.w500(14.sp),
          ),
        ),
        Expanded(
          flex: 6,
          child: Slider.adaptive(
            activeColor: AppColor.primary,
            inactiveColor: AppColor.primary.withValues(alpha: 0.4),
            label: labels != null ? labels[value.toInt()] : null,
            max: 5,
            divisions: 5,
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(
          "${value.toInt()}",
          style: AppTextStyle.w500(16.sp),
        ),
      ],
    );
  }
}
