// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      birthday: const ParseDateUtil().fromJson(json['birthday'] as String?),
      email: json['email'] as String?,
      gender: json['gender'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'birthday': const ParseDateUtil().toJson(instance.birthday),
      'gender': instance.gender,
    };
