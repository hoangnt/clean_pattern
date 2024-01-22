import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController(getIt()), permanent: true);
  }
}
