import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  String? name;
  String? address;
  String? phone;
  String? owner;
  String? bestSeller;
  String? image;
  List<String>? allImage;
  double? rating;

  StoreModel({
    required this.name,
    required this.address,
    required this.owner,
    this.bestSeller,
    this.image,
    this.allImage,
    this.phone,
    this.rating,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
