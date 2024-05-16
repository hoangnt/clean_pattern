// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      isOwner: json['isOwner'] as bool? ?? true,
      text: json['text'] as String?,
      sentAt: const ParseDateAndTimeUtil()
          .fromJson((json['sentAt'] as num?)?.toInt()),
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isOwner': instance.isOwner,
      'sentAt': const ParseDateAndTimeUtil().toJson(instance.sentAt),
    };
