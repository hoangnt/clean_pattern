import 'package:clean_pattern/common/utilities/local_secure_storage_util.dart';
import 'package:clean_pattern/common/utilities/local_storage_util.dart';
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
  final TextEditingController serverController = TextEditingController();

  bool displayPassword = true;
  bool rememberMe = false;

  @override
  void onInit() async {
    super.onInit();

    final email = await LocalSecureStorageUtil.instance.getEmail();
    final password = await LocalSecureStorageUtil.instance.getPassword();

    if (email != null && email.isNotEmpty) {
      emailController.text = email;
    }

    if (password != null && password.isNotEmpty) {
      passwordController.text = password;
    }

    if (LocalStorageUtil.instance.getRememberMe() != null) {
      rememberMe = LocalStorageUtil.instance.getRememberMe()!;
      update();
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

    await handleBaseResponse<Map<String, dynamic>?>(
      usecase: loginUsecase(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
      onSuccess: (data) async {
        if (data == null) {
          Get.dialog(ResultDialog(
            title: "Notice".tr,
            content: "Login failed",
          ));
          return;
        }

        if (rememberMe) {
          await LocalSecureStorageUtil.instance.saveEmail(emailController.text);
          await LocalSecureStorageUtil.instance
              .savePassword(passwordController.text);
        } else {
          await LocalSecureStorageUtil.instance.saveEmail("");
          await LocalSecureStorageUtil.instance.savePassword("");
        }

        await LocalSecureStorageUtil.instance
            .saveAccessToken(data["accessToken"]!);
        await LocalSecureStorageUtil.instance
            .saveRefreshToken(data["refreshToken"]!);

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
        LocalStorageUtil.instance.saveUserInfo(data!);
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
    await LocalStorageUtil.instance.saveRememberMe(val);
    rememberMe = val;
    update();
  }
}
