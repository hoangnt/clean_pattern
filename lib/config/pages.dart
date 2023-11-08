import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/article/presentation/binding/article_binding.dart';
import 'package:clean_pattern/features/article/presentation/binding/article_detail_binding.dart';
import 'package:clean_pattern/features/article/presentation/pages/article_detail_screen.dart';
import 'package:clean_pattern/features/flavor/presentation/binding/flavor_binding.dart';
import 'package:clean_pattern/features/home/presentation/binding/entry_binding.dart';
import 'package:clean_pattern/features/home/presentation/pages/entry_screen.dart';
import 'package:clean_pattern/features/post/presentation/binding/post_binding.dart';
import 'package:clean_pattern/features/post/presentation/pages/post_screen.dart';
import 'package:clean_pattern/features/settings/presentation/binding/settings_binding.dart';
import 'package:clean_pattern/features/store/presentation/binding/store_binding.dart';
import 'package:get/get.dart';

class Pages {
  static final Pages instance = Pages._();

  List<GetPage> getPages = [];

  Pages._() {
    getPages = [
      GetPage(
        name: Routes.entry,
        page: () => EntryScreen(),
        bindings: [
          EntryBinding(),
          StoreBinding(),
          ArticleBinding(),
          FlavorBinding(),
          SettingsBinding(),
        ],
      ),
      GetPage(
        name: Routes.post,
        page: () => PostScreen(),
        binding: PostBinding(),
        transition: Transition.zoom,
      ),
      GetPage(
        name: Routes.articleDetail,
        page: () => ArticleDetailScreen(),
        binding: ArticleDetailBinding(),
        transition: Transition.rightToLeft,
      ),
    ];
  }
}
