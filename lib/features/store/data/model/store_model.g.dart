// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      owner: json['owner'] as String?,
      bestSeller: json['bestSeller'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'owner': instance.owner,
      'bestSeller': instance.bestSeller,
      'image': instance.image,
      'rating': instance.rating,
    };
