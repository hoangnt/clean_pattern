// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String?,
      content: json['content'] as String?,
      author: json['author'] as String?,
      publishedAt:
          const ParseDateUtil().fromJson(json['publishedAt'] as String?),
      image: json['image'] as String?,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'publishedAt': const ParseDateUtil().toJson(instance.publishedAt),
      'image': instance.image,
      'isLiked': instance.isLiked,
    };
