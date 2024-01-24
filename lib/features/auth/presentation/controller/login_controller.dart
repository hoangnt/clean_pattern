import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/auth/domain/usecase/get_user_profile_usecase.dart';
import 'package:clean_pattern/features/auth/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends BaseController {
  final LoginUsecase loginUsecase;
  final GetUserProfileUsecase getUserProfileUsecase;

  LoginController(
    this.loginUsecase,
    this.getUserProfileUsecase,
  );

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

    await handleBaseResponse<Map<String, String>>(
      usecase: loginUsecase(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
      onSuccess: (data) async {
        if (rememberMe) {
          await AppLocalStorage.instance.saveEmail(emailController.text);
          await AppLocalStorage.instance.savePassword(passwordController.text);
        } else {
          await AppLocalStorage.instance.saveEmail("");
          await AppLocalStorage.instance.savePassword("");
        }

        await AppLocalStorage.instance.saveAccessToken(data["accessToken"]!);
        await AppLocalStorage.instance.saveRefreshToken(data["refreshToken"]!);

        // go to home
        Get.offAllNamed(Routes.entry);
      },
      onError: (message) {
        Get.dialog(ResultDialog(
          title: "Notice".tr,
          content: message,
        ));
      },
    );

    handleBaseResponse<UserModel?>(
      usecase: getUserProfileUsecase(),
      onSuccess: (data) async {
        AppLocalStorage.instance.saveUserInfo(data!);
      },
      onError: (message) {
        Get.dialog(ResultDialog(
          title: "Notice".tr,
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
