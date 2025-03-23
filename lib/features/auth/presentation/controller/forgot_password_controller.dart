import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  final forgorPasswordKey =
      GlobalKey<FormState>(debugLabel: "forgot_password_process");
  final TextEditingController emailController = TextEditingController();

  void sendNewPassword() {
    if (!forgorPasswordKey.currentState!.validate()) {
      return;
    }

    Get.offNamed(Routes.login);
  }

  void clearEmail() {
    emailController.clear();
  }
}
