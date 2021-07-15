// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_clothes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPageClothesResponse _$MyPageClothFromJson(Map<String, dynamic> json) {
  return MyPageClothesResponse(
    json['careLabelCount'] as int,
    json['clothId'] as int,
    json['clothType'] as String,
    json['imageUrl'] as String,
    json['requestAt'] as String,
  );
}

Map<String, dynamic> _$MyPageClothToJson(MyPageClothesResponse instance) =>
    <String, dynamic>{
      'careLabelCount': instance.careLabelCount,
      'clothId': instance.clothId,
      'clothType': instance.clothType,
      'imageUrl': instance.imageUrl,
      'requestAt': instance.requestAt,
    };
