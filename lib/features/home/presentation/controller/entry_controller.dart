import 'package:clean_pattern/features/article/presentation/pages/article_screen.dart';
import 'package:clean_pattern/features/customer/presentation/pages/customer_screen.dart';
import 'package:clean_pattern/features/settings/presentation/pages/settings_screen.dart';
import 'package:clean_pattern/features/store/presentation/pages/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabIndex {
  static const int store = 0;
  static const int article = 1;
  static const int flavor = 2;
  static const int setting = 3;
}

class EntryController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> listScreen = [
    StoreScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  void onSelectBottomBar(int index) {
    selectedIndex = index;
    if (index == HomeTabIndex.article &&
        listScreen[index].runtimeType != ArticleScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, ArticleScreen());
    }

    if (index == HomeTabIndex.flavor &&
        listScreen[index].runtimeType != CustomerScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, CustomerScreen());
    }

    if (index == HomeTabIndex.setting &&
        listScreen[index].runtimeType != SettingsScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, SettingsScreen());
    }

    pageController.jumpToPage(index);
    update();
  }

  void onBackDevice(bool didPop, dynamic result) async {
    if (selectedIndex == 0 || didPop) {
      return;
    }
    selectedIndex = 0;
    pageController.jumpToPage(0);
    update();
  }
}
