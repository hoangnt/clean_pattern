import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreDetailController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.90);
  late StoreModel data;

  RxDouble rate = 0.0.obs;
  int currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments as StoreModel;
    rate.value = data.rating!;
  }

  void rating(double val) {
    rate.value = val;
  }

  void setCurrentIndexCarousel(int index) {
    currentIndex = index;
    update();
  }
}
