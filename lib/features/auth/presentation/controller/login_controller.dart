import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/auth/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends BaseController {
  final LoginUsecase loginUsecase;

  LoginController(this.loginUsecase);

  final loginKey = GlobalKey<FormState>(debugLabel: "login_process");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool displayPassword = true;
  bool rememberMe = false;

  @override
  void onInit() {
    super.onInit();

    if (AppLocalStorage.instance.getEmail() != null &&
        AppLocalStorage.instance.getEmail()!.isNotEmpty) {
      emailController.text = AppLocalStorage.instance.getEmail()!;
    }

    if (AppLocalStorage.instance.getPassword() != null &&
        AppLocalStorage.instance.getPassword()!.isNotEmpty) {
      passwordController.text = AppLocalStorage.instance.getPassword()!;
    }

    if (AppLocalStorage.instance.getRememberMe() != null) {
      rememberMe = AppLocalStorage.instance.getRememberMe()!;
    }
  }

  void onCLose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    FocusScope.of(Get.context!).unfocus();
    if (!loginKey.currentState!.validate()) {
      return;
    }

    handleBaseResponse<UserModel?>(
      usecase: loginUsecase(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
      onSuccess: (data) async {
        if (rememberMe) {
          await AppLocalStorage.instance.saveEmail(emailController.text);
          await AppLocalStorage.instance.savePassword(passwordController.text);
        }
        await AppLocalStorage.instance.saveToken("Bearer token");
        Get.offAllNamed(Routes.entry);
      },
      onError: (message) {
        Get.dialog(ResultDialog(
          title: "Notice",
          content: message,
        ));
      },
    );
  }

  void clearEmail() {
    emailController.clear();
  }

  void toggleDisplayPassword() {
    displayPassword = !displayPassword;
    update();
  }

  Future<void> toggleRememberMe(bool val) async {
    await AppLocalStorage.instance.saveRememberMe(val);
    rememberMe = val;
    update();
  }
}
