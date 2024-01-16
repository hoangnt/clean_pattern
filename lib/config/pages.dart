import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/article/presentation/binding/article_binding.dart';
import 'package:clean_pattern/features/article/presentation/binding/article_detail_binding.dart';
import 'package:clean_pattern/features/article/presentation/pages/article_detail_screen.dart';
import 'package:clean_pattern/features/auth/presentation/binding/forgot_password_binding.dart';
import 'package:clean_pattern/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:clean_pattern/features/flavor/presentation/binding/flavor_binding.dart';
import 'package:clean_pattern/features/home/presentation/binding/entry_binding.dart';
import 'package:clean_pattern/features/home/presentation/pages/entry_screen.dart';
import 'package:clean_pattern/features/auth/presentation/binding/login_binding.dart';
import 'package:clean_pattern/features/auth/presentation/screen/login_screen.dart';
import 'package:clean_pattern/features/post/presentation/binding/post_binding.dart';
import 'package:clean_pattern/features/post/presentation/pages/post_screen.dart';
import 'package:clean_pattern/features/settings/presentation/binding/settings_binding.dart';
import 'package:clean_pattern/features/store/presentation/binding/store_binding.dart';
import 'package:clean_pattern/features/store/presentation/binding/store_detail_binding.dart';
import 'package:clean_pattern/features/store/presentation/binding/store_story_binding.dart';
import 'package:clean_pattern/features/store/presentation/pages/store_detail_screen.dart';
import 'package:clean_pattern/features/store/presentation/pages/store_story_screen.dart';
import 'package:get/get.dart';

class Pages {
  static final Pages instance = Pages._();

  List<GetPage> getPages = [];

  Pages._() {
    getPages = [
      GetPage(
        name: Routes.login,
        page: () => LoginScreen(),
        bindings: [
          LoginBinding(),
          SettingsBinding(),
        ],
        transition: Transition.leftToRightWithFade,
      ),
      GetPage(
        name: Routes.forgotPassword,
        page: () => ForgotPasswordScreen(),
        bindings: [
          ForgotPasswordBinding(),
        ],
        transition: Transition.rightToLeftWithFade,
      ),
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
      GetPage(
        name: Routes.storeDetail,
        page: () => StoreDetailScreen(),
        binding: StoreDetailBinding(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: Routes.storeStory,
        page: () => StoreStoryScreen(),
        binding: StoreStoryBinding(),
        transition: Transition.rightToLeftWithFade,
      ),
    ];
  }
}
