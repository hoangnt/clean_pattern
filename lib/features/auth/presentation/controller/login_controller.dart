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

  bool displayPassword = true;
  bool rememberMe = false;

  @override
  void onInit() {
    super.onInit();

    if (LocalStorageUtil.instance.getEmail() != null &&
        LocalStorageUtil.instance.getEmail()!.isNotEmpty) {
      emailController.text = LocalStorageUtil.instance.getEmail()!;
    }

    if (LocalStorageUtil.instance.getPassword() != null &&
        LocalStorageUtil.instance.getPassword()!.isNotEmpty) {
      passwordController.text = LocalStorageUtil.instance.getPassword()!;
    }

    if (LocalStorageUtil.instance.getRememberMe() != null) {
      rememberMe = LocalStorageUtil.instance.getRememberMe()!;
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
          await LocalStorageUtil.instance.saveEmail(emailController.text);
          await LocalStorageUtil.instance.savePassword(passwordController.text);
        } else {
          await LocalStorageUtil.instance.saveEmail("");
          await LocalStorageUtil.instance.savePassword("");
        }

        await LocalStorageUtil.instance.saveAccessToken(data["accessToken"]!);
        await LocalStorageUtil.instance.saveRefreshToken(data["refreshToken"]!);

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
