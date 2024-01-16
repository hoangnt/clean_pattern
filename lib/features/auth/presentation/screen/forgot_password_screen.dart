import 'package:clean_pattern/common/constant/app_asset.dart';
import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _controller = Get.find<ForgotPasswordController>();
  final _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
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
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.1.sh),
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAsset.ramenColorful),
            ),
          ],
        ),
      ),
    );
  }
}
