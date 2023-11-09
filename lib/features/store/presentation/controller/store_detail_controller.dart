import 'package:clean_pattern/features/store/data/model/store_model.dart';
import 'package:get/get.dart';

class StoreDetailController extends GetxController {
  late StoreModel data;
  RxDouble rate = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments as StoreModel;
    rate.value = data.rating!;
  }

  void rating(double val) {
    rate.value = val;
  }
}
