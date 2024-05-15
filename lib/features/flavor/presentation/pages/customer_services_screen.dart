import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/widget/app_empty_data_widget.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/features/flavor/presentation/controller/customer_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerServicesScreen extends StatelessWidget {
  final _controller = Get.find<CustomerServicesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Customer Services"),
      ),
      body: Obx(() {
        if (_controller.chatData.isEmpty) {
          return AppEmptyDataWidget(
            text: "no data",
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: _controller.chatData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: AppColor.disable),
                    ),
                    child: Text(
                      _controller.chatData[index],
                      style: AppTextStyle.normal(),
                    ),
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
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: AppTextField(
              controller: _controller.msgController,
              hintText: "Something confused, just ask me.",
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
