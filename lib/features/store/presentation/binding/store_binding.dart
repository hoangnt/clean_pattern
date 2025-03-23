import 'package:clean_pattern/config/injection.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_controller.dart';
import 'package:get/get.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController(
          getIt(),
          getIt(),
        ));
  }
}
