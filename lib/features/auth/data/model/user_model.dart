import 'package:clean_pattern/common/utilities/parse_date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? email;
  String? avatarUrl;

  @ParseDateUtil()
  DateTime? birthday;
  int? gender;

  UserModel({
    this.birthday,
    this.email,
    this.gender,
    this.name,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
