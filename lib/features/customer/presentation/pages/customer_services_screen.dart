import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/app_empty_data_widget.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/features/customer/presentation/controller/customer_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clean_pattern/common/extensions/datetime_extension.dart';

class CustomerServicesScreen extends StatelessWidget {
  final _controller = Get.find<CustomerServicesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat to us".tr),
      ),
      body: Obx(() {
        if (_controller.chatData.isEmpty) {
          return const AppEmptyDataWidget(
            text: "no data",
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 10.h),
                controller: _controller.scrollController,
                itemCount: _controller.chatData.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      if (_controller.chatData[index].isOwner) const Spacer(),
                      LimitedBox(
                        maxWidth: 280.w,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: _controller.chatData[index].isOwner
                                ? AppColor.primaryLight
                                : Get.theme.bottomAppBarTheme.color,
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(color: AppColor.disable),
                          ),
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                Text(
                                  _controller.chatData[index].text ?? "",
                                  style: AppTextStyle.normal(18.sp),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    _controller
                                        .chatData[index].sentAt!.toHHmmString,
                                    style: AppTextStyle.w200(12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            _sendMessageWidget()
          ],
        );
      }),
    );
  }

  Widget _sendMessageWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      color: Get.theme.bottomAppBarTheme.color,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: AppTextField(
              controller: _controller.msgController,
              hintText: "Something confused, just ask.".tr,
              maxLines: null,
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: AppElevatedButton(
              width: double.infinity,
              height: 40.h,
              onPressed: _controller.sendMessage,
              text: "Send",
            ),
          ),
        ],
      ),
    );
  }
}
