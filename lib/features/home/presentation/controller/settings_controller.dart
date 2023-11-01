import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  String mode = AppThemeMode.light;

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
}
