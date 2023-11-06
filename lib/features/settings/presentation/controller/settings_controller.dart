import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final MethodChannel channel = MethodChannel("com.example.clean_pattern");
  String mode = AppThemeMode.light;
  int language = AppLanguage.eng;

  bool displayLanguages = false;

  int? luckyNumber;

  @override
  void onInit() {
    super.onInit();

    channel.setMethodCallHandler((call) async {
      if (call.method == "luckyNumber") {
        luckyNumber = call.arguments as int;
        update();
      }

      return null;
    });
  }

  void getLuckyNumber() {
    channel.invokeMethod("luckyNumber");
  }

  void toggleTheme() async {
    if (mode == AppThemeMode.light) {
      mode = AppThemeMode.dark;
      Get.changeTheme(AppTheme.darkTheme);
    } else {
      mode = AppThemeMode.light;
      Get.changeTheme(AppTheme.lightTheme);
    }

    // Delay for color change in getx super controller
    await Future.delayed(Duration(milliseconds: 200));
    Get.find<EntryController>().update();
    update();
  }

  void changeLanguage(int? val) {
    if (language == AppLanguage.eng) {
      language = AppLanguage.vie;
      Get.updateLocale(Locale("vi", "VN"));
    } else {
      language = AppLanguage.eng;
      Get.updateLocale(Locale("en", "US"));
    }
    update();
  }

  void toggleDisplayLanguage() {
    displayLanguages = !displayLanguages;
    update();
  }
}
