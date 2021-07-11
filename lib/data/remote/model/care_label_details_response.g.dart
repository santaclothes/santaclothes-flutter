// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_label_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareLabelDetailsResponse _$CareLabelDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return CareLabelDetailsResponse(
    json['iconUrl'] as String,
    json['name'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$CareLabelDetailsResponseToJson(
        CareLabelDetailsResponse instance) =>
    <String, dynamic>{
      'iconUrl': instance.iconUrl,
      'name': instance.name,
      'description': instance.description,
    };
