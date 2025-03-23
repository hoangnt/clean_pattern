import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/core_ui/app_style.dart';
import 'package:clean_pattern/common/utilities/validate_util.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _controller = Get.find<ForgotPasswordController>();
  final _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) {
          return;
        }
        
        Get.offNamed(Routes.login);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Get.theme.appBarTheme.backgroundColor,
          body: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 12.h, right: 20.w),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "We will reset password and send to your email".tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.w600(22.sp),
                ),
              ),
              Text(
                "Write down your email here".tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.w600(22.sp),
              ),
              SizedBox(height: 20.h),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _controller.forgorPasswordKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _controller.emailController,
                        validator: ValidateUtil.validateEmail,
                        hintText: "weloveramen@mail.com",
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35.h,
                        child: AppElevatedButton(
                          onPressed: _controller.sendNewPassword,
                          text: "Send".tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        height: 35.h,
                        child: AppElevatedButton(
                          onPressed: () => Get.offNamed(Routes.login),
                          backgroundColor: Get.theme.scaffoldBackgroundColor,
                          textColor: AppColor.disable,
                          text: "Back".tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
