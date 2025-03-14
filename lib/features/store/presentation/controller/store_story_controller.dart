import 'dart:async';

import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:clean_pattern/features/store/presentation/controller/store_controller.dart';
import 'package:get/get.dart';

class StoreStoryController extends GetxController {
  final int defaultStoryTime = 4;
  final _storeController = Get.find<StoreController>();

  late StoreModel data;
  late int index;
  late Timer? storyTimer;

  RxDouble storyTiming = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments["data"] as StoreModel;
    index = Get.arguments["index"] as int;
  }

  void startTimingStory() {
    storyTimer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (timer) {
        print("Tick: ${timer.tick} - index $index");
        if (timer.tick == defaultStoryTime + 1) {
          goNextStory();
          return;
        }
        storyTiming.value = timer.tick.toDouble();
        update();
      },
    );
  }

  void goNextStory() {
    if (index == _storeController.listTopStore.length - 1) {
      storyTimer?.cancel();
      Get.back();
      return;
    }

    storyTimer?.cancel();
    Get.offNamed(
      Routes.storeStory,
      arguments: {
        "data": _storeController.listTopStore[index + 1],
        "index": index + 1,
      },
      preventDuplicates: false,
    );
  }

  void onBack() {
    storyTimer?.cancel();
    Get.back();
  }

  void onBackPhysics(bool didPop, dynamic result) async {
    storyTimer?.cancel();
  }
}
