import 'package:json_annotation/json_annotation.dart';

part 'notification_item_response.g.dart';

/// id : 9
/// analysisRequestId : 29
/// clothName : "테스트1"

@JsonSerializable()
class NotificationItemResponse {
  final int id;
  final int analysisRequestId;
  final String clothName;

  NotificationItemResponse(this.id, this.analysisRequestId, this.clothName);

  factory NotificationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemResponseToJson(this);
}
