import 'package:clean_pattern/common/utilities/di.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/article_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/flavor_controller.dart';
import 'package:clean_pattern/features/home/presentation/controller/store_controller.dart';
import 'package:get/get.dart';

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryController>(() => EntryController());
    Get.lazyPut<ArticleController>(() => ArticleController(getIt()));
    Get.lazyPut<StoreController>(() => StoreController(
          getIt(),
          getIt(),
        ));
    Get.lazyPut<FlavorController>(() => FlavorController());
  }
}
