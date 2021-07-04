import 'package:santaclothes/data/model/notification_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

class NotificationRepository {
  Future<NotificationResponse> getNotification(int page, int count) {
    return ApiProvider.instance.getNotification(page, count);
  }
}
