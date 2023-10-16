import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  String? name;
  String? address;
  String? owner;
  String? bestSeller;
  String? image;

  StoreModel({
    required this.name,
    required this.address,
    required this.owner,
    this.bestSeller,
    this.image,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
