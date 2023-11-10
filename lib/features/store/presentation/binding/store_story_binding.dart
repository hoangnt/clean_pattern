import 'package:clean_pattern/features/store/presentation/controller/store_story_controller.dart';
import 'package:get/get.dart';

class StoreStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreStoryController>(() => StoreStoryController());
  }
}
