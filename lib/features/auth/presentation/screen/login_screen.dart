import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/utilities/validate_util.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: GetBuilder<LoginController>(builder: (controller) {
          return Column(
            children: [
              SizedBox(height: 0.1.sh),
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppAsset.ramenColorful),
              ),
              SizedBox(height: 30.h),
              Text(
                "Hello".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Login and Enjoy your food trip !".tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _controller.loginKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _controller.emailController,
                        validator: ValidateUtil.instance.validateEmail,
                        hintText: "weloveramen@mail.com",
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: AppColor.textFieldBorderColor,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _controller.clearEmail,
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColor.textFieldBorderColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppTextField(
                        controller: _controller.passwordController,
                        obscureText: _controller.displayPassword,
                        validator: ValidateUtil.instance.validatePassword,
                        hintText: "Password".tr,
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          color: AppColor.textFieldBorderColor,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _controller.toggleDisplayPassword,
                          child: Icon(
                            _controller.displayPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_rounded,
                            color: AppColor.textFieldBorderColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 30.h,
                  width: double.infinity,
                  child: AppElevatedButton(
                    onPressed: _controller.login,
                    text: "Login".tr,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
