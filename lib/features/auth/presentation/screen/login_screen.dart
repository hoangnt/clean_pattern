import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/utilities/validate_util.dart';
import 'package:clean_pattern/common/widget/app_check_box.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/presentation/controller/login_controller.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.find<LoginController>();
  final _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.appBarTheme.backgroundColor,
      body: GetBuilder<LoginController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5.h, left: 20.w),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary, width: 2),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: InkWell(
                        onTap: () => _settingController.changeLanguage(null),
                        child: Text(
                          _settingController.language == AppLanguage.eng
                              ? "ENG"
                              : "VIE",
                          style: AppTextStyle.normal(16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.1.sh),
              Hero(
                tag: "colorfulLogo",
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  final scaleTween = Tween(begin: 1.0, end: 1.5);
                  final anim = scaleTween.animate(animation);
                  return ScaleTransition(
                    scale: anim,
                    child: Assets.icon.ramenColorful.image(),
                  );
                },
                child: Assets.icon.ramenColorful.image(),
              ),
              SizedBox(height: 30.h),
              Text(
                "Hello".tr,
                style: AppTextStyle.w600(22.sp),
              ),
              Text(
                "Login and Enjoy your food trip !".tr,
                style: AppTextStyle.w600(22.sp),
              ),
              SizedBox(height: 25.h),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _controller.loginKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _controller.emailController,
                        validator: ValidateUtil.validateEmail,
                        hintText: "weloveramen@mail.com",
                        textInputAction: TextInputAction.next,
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Get.theme.iconTheme.color,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _controller.clearEmail,
                          child: Icon(
                            Icons.close_rounded,
                            color: Get.theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      AppTextField(
                        controller: _controller.passwordController,
                        obscureText: _controller.displayPassword,
                        validator: ValidateUtil.validatePassword,
                        hintText: "Password".tr,
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          color: Get.theme.iconTheme.color,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _controller.toggleDisplayPassword,
                          child: Icon(
                            _controller.displayPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_rounded,
                            color: Get.theme.iconTheme.color,
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
                child: Row(
                  children: [
                    AppCheckBox(
                      text: "Remember me".tr,
                      value: _controller.rememberMe,
                      onChanged: _controller.toggleRememberMe,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Get.offNamed(Routes.forgotPassword),
                      child: Text(
                        "Forgot password?".tr,
                        style: AppTextStyle.normal(16.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 35.h,
                  width: double.infinity,
                  child: AppElevatedButton(
                    onPressed: _controller.login,
                    text: "Login".tr,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(color: AppColor.disable, thickness: 2),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "or".tr,
                      style: AppTextStyle.normal(16.sp),
                    ),
                    SizedBox(width: 5.w),
                    const Expanded(
                      child: Divider(color: AppColor.disable, thickness: 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _platformLogin(
                      onTap: () {
                        print("facebook login");
                      },
                      icon: Assets.icon.facebook.path,
                    ),
                    _platformLogin(
                      onTap: () {
                        print("google login");
                      },
                      icon: Assets.icon.google.path,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RichText(
                  text: TextSpan(
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16.sp),
                    children: [
                      TextSpan(text: "You have an account, don't you ?".tr),
                      WidgetSpan(
                        child: SizedBox(width: 5.w),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("sign up here");
                          },
                        text: "Sign up here".tr,
                        style: const TextStyle(
                          color: AppColor.textAvailable,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _platformLogin({void Function()? onTap, required String icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          border: Border.all(color: AppColor.buttonBorder),
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 4),
              blurRadius: 3,
              spreadRadius: 1,
              color: AppColor.disable.withValues(alpha: 0.7),
            ),
          ],
        ),
        child: Image.asset(icon, height: 30.h),
      ),
    );
  }
}
