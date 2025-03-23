import 'package:clean_pattern/config/injection.dart';
import 'package:clean_pattern/features/article/presentation/controller/article_controller.dart';
import 'package:get/get.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(() => ArticleController(getIt()));
  }
}
