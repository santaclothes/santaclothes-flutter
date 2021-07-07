import 'package:json_annotation/json_annotation.dart';

import 'notification_item_response.dart';

part 'notification_response.g.dart';

/// userName : "유광우"
/// notificationElements : [{"id":9,"analysisRequestId":29,"clothName":"테스트1"},{"id":10,"analysisRequestId":30,"clothName":"테스트2"}]

@JsonSerializable()
class NotificationResponse {
  final String userName;
  final List<NotificationItemResponse> notificationElements;

  NotificationResponse(this.userName, this.notificationElements);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
