import 'package:get/get.dart';

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

class SettingsController extends GetxController {
  double salt = 3;
  double fat = 3;
  double noodleTender = 1;
  BrothEnum? broth;
  List<ToppingEnum> toppingList = [];

  void onChangeSalt(double val) {
    salt = val;
    update();
  }

  void onChangeFat(double val) {
    fat = val;
    update();
  }

  void onChangeNoodleTender(double val) {
    noodleTender = val;
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
}
