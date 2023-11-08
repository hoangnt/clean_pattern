import 'package:clean_pattern/features/article/presentation/pages/article_screen.dart';
import 'package:clean_pattern/features/flavor/presentation/pages/flavor_screen.dart';
import 'package:clean_pattern/features/settings/presentation/pages/settings_screen.dart';
import 'package:clean_pattern/features/store/presentation/pages/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> listScreen = [
    StoreScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  void onSelectBottomBar(int index) {
    selectedIndex = index;
    if (index == 1 && listScreen[index].runtimeType != ArticleScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, ArticleScreen());
    }

    if (index == 2 && listScreen[index].runtimeType != FlavorScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, FlavorScreen());
    }

    if (index == 3 && listScreen[index].runtimeType != SettingsScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, SettingsScreen());
    }

    pageController.jumpToPage(index);
    update();
  }

  Future<bool> onBackDevice() async {
    if (selectedIndex == 0) {
      return true;
    }
    selectedIndex = 0;
    pageController.jumpToPage(0);
    update();
    return false;
  }
}
