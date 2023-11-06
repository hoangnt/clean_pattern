import 'package:clean_pattern/features/flavor/presentation/controller/flavor_controller.dart';
import 'package:get/get.dart';

class FlavorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlavorController>(() => FlavorController());
  }
}
