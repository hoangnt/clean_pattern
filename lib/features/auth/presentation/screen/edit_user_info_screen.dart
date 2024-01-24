import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/utilities/validate_util.dart';
import 'package:clean_pattern/common/widget/app_progress_indicator.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/features/auth/presentation/controller/edit_user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditUserInfoScreen extends StatelessWidget {
  final _controller = Get.find<EditUserInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit user info"),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.topCenter,
            child: IntrinsicWidth(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  _controller.userInfo!.avatarUrl != null
                      ? CachedNetworkImage(
                          imageUrl: _controller.userInfo!.avatarUrl!,
                          errorWidget: (context, _, __) => Center(
                            child: Icon(Icons.error),
                          ),
                          progressIndicatorBuilder: (_, __, progress) =>
                              Container(
                            width: 100.w,
                            height: 100.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Get.theme.scaffoldBackgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: AppProgressIndicator(progress.progress),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 100.w,
                            height: 100.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: 100.w,
                          height: 100.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: AppColor.disable,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person_3_outlined, size: 35.w),
                        ),
                  InkWell(
                    onTap: () {
                      print("camera avatar");
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Form(
            key: _controller.editKeyForm,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  AppTextField(
                    controller: _controller.nameController,
                    validator: ValidateUtil.instance.validateEmpty,
                    hintText: "We Love Ramen",
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: Get.theme.iconTheme.color,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    controller: _controller.emailController,
                    validator: ValidateUtil.instance.validateEmail,
                    hintText: "weloveramen@gmail.com",
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Get.theme.iconTheme.color,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    onTap: () => _controller.birthdayPicker(context),
                    readOnly: true,
                    controller: _controller.birthdayController,
                    validator: ValidateUtil.instance.validateEmpty,
                    hintText: "13/08/1995",
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icon(
                      Icons.cake_outlined,
                      color: Get.theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 30.h,
              width: double.infinity,
              child: AppElevatedButton(
                onPressed: _controller.saveUserInfo,
                text: "Save".tr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
