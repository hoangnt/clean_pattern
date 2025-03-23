import 'package:clean_pattern/common/utilities/parse_date_and_time_util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  String? text;
  bool isOwner;

  @ParseDateAndTimeUtil()
  DateTime? sentAt;

  ChatMessageModel({
    this.isOwner = true,
    this.text,
    this.sentAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
