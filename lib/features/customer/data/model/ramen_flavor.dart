import 'package:clean_pattern/common/constant/hive_box_key.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ramen_flavor.g.dart';

@HiveType(typeId: HiveAdapterId.ramenFlavor)
class RamenFlavor extends HiveObject {
  @HiveField(0)
  double? salt;
  @HiveField(1)
  double? fat;
  @HiveField(2)
  double? noodleTenderness;
  @HiveField(3)
  String? broth;
  @HiveField(4)
  List<String> toppingList = [];

  RamenFlavor({
    this.salt,
    this.broth,
    this.fat,
    this.noodleTenderness,
    required this.toppingList,
  });

  RamenFlavor.fromJson(Map<String, dynamic> json) {
    this.salt = json["salt"];
    this.fat = json["fat"];
    this.noodleTenderness = json["noodleTenderness"];
    this.broth = json["broth"];
    this.toppingList =
        json["toppingList"] != null ? json["toppingList"] as List<String> : [];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json["salt"] = this.salt;
    json["fat"] = this.fat;
    json["noodleTenderness"] = this.noodleTenderness;
    json["broth"] = this.broth;
    json["toppingList"] = this.toppingList;
    return json;
  }
}
