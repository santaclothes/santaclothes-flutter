// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notices _$NoticesFromJson(Map<String, dynamic> json) {
  return Notices(
    json['content'] as String,
    json['hint'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$NoticesToJson(Notices instance) => <String, dynamic>{
      'content': instance.content,
      'hint': instance.hint,
      'title': instance.title,
    };
