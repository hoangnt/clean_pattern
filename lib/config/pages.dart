import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/home/presentation/binding/entry_binding.dart';
import 'package:clean_pattern/features/home/presentation/pages/entry_screen.dart';
import 'package:clean_pattern/features/post/presentation/binding/post_binding.dart';
import 'package:clean_pattern/features/post/presentation/pages/post_screen.dart';
import 'package:get/get.dart';

class Pages {
  static final Pages instance = Pages._();

  List<GetPage> getPages = [];

  Pages._() {
    getPages = [
      GetPage(
        name: Routes.entry,
        page: () => EntryScreen(),
        binding: EntryBinding(),
      ),
      GetPage(
        name: Routes.post,
        page: () => PostScreen(),
        binding: PostBinding(),
        transition: Transition.rightToLeft,
      ),
    ];
  }
}
