import 'dart:async';

import 'package:clean_pattern/common/constant/hive_box_key.dart';
import 'package:clean_pattern/features/home/data/model/ramen_flavor.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum BrothEnum { tonkotsu, shoyu, miso, shio, tantan }

enum ToppingEnum {
  chashu,
  menma,
  ajimata,
  kamaboko,
  nori,
  paro,
  nira,
  kimchi,
  matsutake
}

class FlavorController extends GetxController {
  double salt = 1;
  double fat = 1;
  double noodleTenderness = 1;
  BrothEnum? broth;
  List<ToppingEnum> toppingList = [];

  DateTime appTime = DateTime.now();
  RxInt hour = 0.obs;
  RxInt min = 0.obs;
  RxInt sec = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // app time
    hour.value = appTime.hour;
    min.value = appTime.minute;
    sec.value = appTime.second;

    Timer.periodic(Duration(seconds: 1), _setTime);

    Box<RamenFlavor> box = Hive.box<RamenFlavor>(HiveBoxKey.ramenFlavor);

    if (box.isEmpty) {
      return;
    }

    RamenFlavor data = box.values.first;
    salt = data.salt ?? this.salt;
    fat = data.fat ?? this.fat;
    noodleTenderness = data.noodleTenderness ?? this.noodleTenderness;
    broth = data.broth != null
        ? BrothEnum.values.where((val) => val.name == data.broth).first
        : null;
    toppingList = ToppingEnum.values
        .where((val) => data.toppingList.contains(val.name))
        .toList();
  }

  void onChangeSalt(double val) {
    salt = val;
    update();
  }

  void onChangeFat(double val) {
    fat = val;
    update();
  }

  void onChangeNoodleTender(double val) {
    noodleTenderness = val;
    update();
  }

  void pickBroth(BrothEnum val) {
    broth = val;
    update();
  }

  void addTopping(ToppingEnum val) {
    if (toppingList.contains(val)) {
      toppingList.remove(val);
    } else {
      toppingList.add(val);
    }
    update();
  }

  Future<bool> saveRamenFlavor() async {
    try {
      Box<RamenFlavor> box = Hive.box<RamenFlavor>(HiveBoxKey.ramenFlavor);
      await box.clear();

      RamenFlavor data = RamenFlavor(
        salt: salt,
        fat: fat,
        noodleTenderness: noodleTenderness,
        broth: broth != null ? broth!.name : null,
        toppingList: toppingList.map((val) => val.name).toList(),
      );
      await box.add(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void _setTime(Timer timer) {
    sec++;
    if (sec.value == 59) {
      min++;
      sec.value = 0;
    }

    if (min.value == 59) {
      hour++;
      min.value = 0;
    }

    if (hour.value == 24) {
      hour.value = 0;
    }
  }
}
