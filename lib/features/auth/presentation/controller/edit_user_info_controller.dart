import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/extensions/string_extension.dart';
import 'package:clean_pattern/common/utilities/permission_util.dart';
import 'package:clean_pattern/common/widget/dialog/bottom_dialog.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:clean_pattern/features/flavor/presentation/controller/flavor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> birthdayPicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: userInfo!.birthday ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null) {
      return;
    }

    birthdayController.text = selectedDate.toDDMMYYYYString();
  }

  Future<void> saveUserInfo() async {
    if (!editKeyForm.currentState!.validate()) {
      return;
    }

    if (userInfo!.name == nameController.text &&
        userInfo!.email == nameController.text &&
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
    await AppLocalStorage.instance.saveUserInfo(userInfo!);

    var flavorController = Get.find<FlavorController>();
    flavorController.userInfo = AppLocalStorage.instance.getUserInfo();
    flavorController.update();

    Get.dialog(ResultDialog(
      title: "Notice",
      content: "Save user info success",
    ));
  }

  Future<void> changeAvatar() async {
    await PermissionUtil.getCameraAndPhotoPermission();

    Get.bottomSheet(BottomDialog(
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              Get.back();
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              print(image);
            },
            child: Text(
              "Take a picture".tr,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(thickness: 1.5),
          InkWell(
            onTap: () async {
              Get.back();
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              print(image);
            },
            child: Text(
              "Choose in library".tr,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
