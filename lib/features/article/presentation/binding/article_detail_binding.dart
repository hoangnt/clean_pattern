import 'package:clean_pattern/config/injection.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_detail_controller.dart';
import 'package:get/get.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleDetailController>(
      () => ArticleDetailController(getIt()),
      tag: Get.parameters["tag"]
    );
  }
}
