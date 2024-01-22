import 'package:clean_pattern/common/utilities/di.dart';
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
