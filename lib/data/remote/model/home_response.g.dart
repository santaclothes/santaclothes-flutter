// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    json['hasNewNotification'] as bool,
    json['totalClothesCount'] as int,
    json['userName'] as String,
    (json['notices'] as List<dynamic>)
        .map((e) => HomeNoticesResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'hasNewNotification': instance.hasNewNotification,
      'totalClothesCount': instance.totalClothesCount,
      'userName': instance.userName,
      'notices': instance.notices.map((e) => e.toJson()).toList(),
    };
