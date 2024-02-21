import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel {
  String? name;
  String? image;
  double? price;

  DishModel({
    this.image,
    this.name,
    this.price,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
