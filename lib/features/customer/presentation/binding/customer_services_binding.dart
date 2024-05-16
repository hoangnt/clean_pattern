import 'package:clean_pattern/features/customer/presentation/controller/customer_services_controller.dart';
import 'package:get/get.dart';

class CustomerServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerServicesController>(() => CustomerServicesController());
  }
}
