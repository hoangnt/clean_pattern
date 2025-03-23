import 'package:clean_pattern/common/utilities/parse_date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  String? title;
  String? content;
  String? author;

  @ParseDateUtil()
  DateTime? publishedAt;
  String? image;
  bool? isLiked;

  ArticleModel({
    this.title,
    this.content,
    this.author,
    this.publishedAt,
    this.image,
    this.isLiked,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
