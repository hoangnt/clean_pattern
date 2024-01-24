import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/extensions/string_extension.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditUserInfoController extends GetxController {
  final editKeyForm = GlobalKey<FormState>(debugLabel: "edit_process");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  UserModel? userInfo;

  @override
  void onInit() {
    super.onInit();

    userInfo = AppLocalStorage.instance.getUserInfo();
    nameController.text = userInfo!.name ?? "";
    emailController.text = userInfo!.email ?? "";
    birthdayController.text = userInfo!.birthday != null
        ? userInfo!.birthday!.toDDMMYYYYString()
        : "";
  }

  Future<void> saveUserInfo() async {
    if (!editKeyForm.currentState!.validate()) {
      return;
    }

    if (userInfo!.name == nameController.text ||
        userInfo!.email == nameController.text ||
        userInfo!.birthday ==
            DateFormat("dd/MM/yyyy").parse(birthdayController.text)) {
      Get.dialog(ResultDialog(
        title: "Notice",
        content: "Nothing change",
      ));
      return;
    }

    userInfo!.name = nameController.text;
    userInfo!.email = emailController.text;
    userInfo!.birthday =
        DateFormat("dd/MM/yyyy").parse(birthdayController.text);
    Get.dialog(ResultDialog(
      title: "Notice",
      content: "Save user info success",
    ));
  }
}
