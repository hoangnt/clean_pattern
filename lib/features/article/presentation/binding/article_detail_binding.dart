import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_detail_controller.dart';
import 'package:get/get.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleDetailController>(
        () => ArticleDetailController(getIt()));
  }
}
