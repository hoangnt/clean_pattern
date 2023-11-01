import 'package:clean_pattern/features/home/presentation/pages/article_screen.dart';
import 'package:clean_pattern/features/home/presentation/pages/flavor_screen.dart';
import 'package:clean_pattern/features/home/presentation/pages/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> listScreen = [
    StoreScreen(),
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

    pageController.jumpToPage(index);
    update();
  }
}
