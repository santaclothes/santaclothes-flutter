// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_cloth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPageCloth _$MyPageClothFromJson(Map<String, dynamic> json) {
  return MyPageCloth(
    json['careLabelCount'] as int,
    json['clothId'] as int,
    json['clothType'] as String,
    json['imageUrl'] as String,
    json['requestAt'] as String,
  );
}

Map<String, dynamic> _$MyPageClothToJson(MyPageCloth instance) =>
    <String, dynamic>{
      'careLabelCount': instance.careLabelCount,
      'clothId': instance.clothId,
      'clothType': instance.clothType,
      'imageUrl': instance.imageUrl,
      'requestAt': instance.requestAt,
    };
