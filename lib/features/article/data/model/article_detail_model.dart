import 'package:clean_pattern/common/utilities/parse_date_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_detail_model.g.dart';

@JsonSerializable()
class ArticleDetailModel {
  String? title;
  String? subTitle;
  String? content;
  String? author;

  @ParseDateUtil()
  DateTime? publishedAt;
  List<String> images = [];
  String? video;

  ArticleDetailModel({
    this.title,
    this.content,
    this.author,
    this.publishedAt,
    required this.images,
    this.subTitle,
    this.video,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleDetailModelToJson(this);
}
