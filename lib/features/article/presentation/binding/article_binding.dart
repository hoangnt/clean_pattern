import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_controller.dart';
import 'package:get/get.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(() => ArticleController(getIt()));
  }
}
