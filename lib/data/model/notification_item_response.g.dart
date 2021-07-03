// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationItemResponse _$NotificationItemResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationItemResponse(
    json['id'] as int,
    json['analysisRequestId'] as int,
    json['clothName'] as String,
  );
}

Map<String, dynamic> _$NotificationItemResponseToJson(
        NotificationItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'analysisRequestId': instance.analysisRequestId,
      'clothName': instance.clothName,
    };
