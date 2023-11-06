import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:get/get.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(() => EntryController());
  }
}
