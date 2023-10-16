import 'package:clean_pattern/features/home/presentation/pages/home_screen.dart';
import 'package:clean_pattern/features/home/presentation/pages/settings_screen.dart';
import 'package:clean_pattern/features/home/presentation/pages/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> listScreen = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
  ];

  void onSelectBottomBar(int index) {
    selectedIndex = index;
    if (index == 1 && listScreen[index].runtimeType != StoreScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, StoreScreen());
    }

    if (index == 2 && listScreen[index].runtimeType != SettingsScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, SettingsScreen());
    }

    pageController.jumpToPage(index);
    update();
  }
}
