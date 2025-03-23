import 'package:clean_pattern/config/injection.dart';
import 'package:clean_pattern/features/auth/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(getIt(), getIt()),
    );
  }
}
