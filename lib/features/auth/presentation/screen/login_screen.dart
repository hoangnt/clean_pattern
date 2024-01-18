import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/utilities/validate_util.dart';
import 'package:clean_pattern/common/widget/app_check_box.dart';
import 'package:clean_pattern/common/widget/app_text_field.dart';
import 'package:clean_pattern/common/widget/button/app_elevated_button.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/presentation/controller/login_controller.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.find<LoginController>();
  final _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Get.theme.appBarTheme.backgroundColor,
        body: GetBuilder<LoginController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h, right: 20.w),
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
                          style: TextStyle(fontSize: 15.sp),
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
                      child: Image.asset(AppAsset.ramenColorful),
                    );
                  },
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
                        SizedBox(height: 10.h),
                        AppTextField(
                          controller: _controller.passwordController,
                          obscureText: _controller.displayPassword,
                          validator: ValidateUtil.instance.validatePassword,
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
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      AppCheckBox(
                        text: "Remember me".tr,
                        value: _controller.rememberMe,
                        onChanged: _controller.toggleRememberMe,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Get.offNamed(Routes.forgotPassword),
                        child: Text(
                          "Forgot password?".tr,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
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
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(color: AppColor.disable, thickness: 2),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "or".tr,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
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
                        icon: AppAsset.facebook,
                      ),
                      _platformLogin(
                        onTap: () {
                          print("google login");
                        },
                        icon: AppAsset.google,
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
                          .copyWith(fontSize: 15.sp),
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
                          style: TextStyle(
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
      ),
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
              offset: Offset(1.5, 4),
              blurRadius: 3,
              spreadRadius: 1,
              color: AppColor.disable.withOpacity(0.7),
            ),
          ],
        ),
        child: Image.asset(icon, height: 30.h),
      ),
    );
  }
}
