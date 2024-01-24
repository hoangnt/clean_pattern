import 'package:clean_pattern/features/auth/presentation/controller/edit_user_info_controller.dart';
import 'package:get/get.dart';

class EditUserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserInfoController>(() => EditUserInfoController());
  }
}
