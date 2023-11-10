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
  late Timer storyTimer;

  RxDouble storyTiming = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments["data"] as StoreModel;
    index = Get.arguments["index"] as int;
  }

  void startTimingStory() {
    storyTimer = Timer.periodic(
      Duration(milliseconds: 1000),
      (timer) {
        if (timer.tick == defaultStoryTime + 1) {
          goNextStory(timer);
          return;
        }
        storyTiming.value = timer.tick.toDouble();
        update();
      },
    );
  }

  void goNextStory(Timer timer) {
    if (index == _storeController.listTopStore.length - 1) {
      Get.back();
      timer.cancel();
      return;
    }

    timer.cancel();
    Get.offNamed(
      Routes.storeStory,
      arguments: {
        "data": _storeController.listTopStore[index + 1],
        "index": index + 1,
      },
      preventDuplicates: false,
    );
  }

  void back() {
    onBack();
    Get.back();
  }

  Future<bool> onBack() async {
    storyTimer.cancel();
    return true;
  }
}
