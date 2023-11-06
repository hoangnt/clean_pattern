// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailModel _$ArticleDetailModelFromJson(Map<String, dynamic> json) =>
    ArticleDetailModel(
      title: json['title'] as String?,
      content: json['content'] as String?,
      author: json['author'] as String?,
      publishedAt:
          const ParseDateUtil().fromJson(json['publishedAt'] as String?),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      subTitle: json['subTitle'] as String?,
      video: json['video'] as String?,
    );

Map<String, dynamic> _$ArticleDetailModelToJson(ArticleDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'content': instance.content,
      'author': instance.author,
      'publishedAt': const ParseDateUtil().toJson(instance.publishedAt),
      'images': instance.images,
      'video': instance.video,
    };
