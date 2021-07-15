// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_notice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNoticesResponse _$NoticesFromJson(Map<String, dynamic> json) {
  return HomeNoticesResponse(
    json['content'] as String,
    json['hint'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$NoticesToJson(HomeNoticesResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'hint': instance.hint,
      'title': instance.title,
    };
