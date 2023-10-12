import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/home_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/settings_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/store_controller.dart';
import 'package:get/get.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(() => EntryController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
