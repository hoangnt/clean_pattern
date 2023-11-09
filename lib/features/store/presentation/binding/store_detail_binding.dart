import 'package:clean_pattern/features/store/presentation/controller/store_detail_controller.dart';
import 'package:get/get.dart';

class StoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreDetailController());
  }
}
