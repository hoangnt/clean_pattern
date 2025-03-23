import 'package:clean_pattern/features/post/presentation/controller/post_controller.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController(), permanent: true);
  }
}
