// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPageResponse _$MyPageResponseFromJson(Map<String, dynamic> json) {
  return MyPageResponse(
    json['myClothesCount'] as int,
    (json['myPageClothes'] as List<dynamic>)
        .map((e) => MyPageCloth.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['userName'] as String,
  );
}

Map<String, dynamic> _$MyPageResponseToJson(MyPageResponse instance) =>
    <String, dynamic>{
      'myClothesCount': instance.myClothesCount,
      'myPageClothes': instance.myPageClothes.map((e) => e.toJson()).toList(),
      'userName': instance.userName,
    };
