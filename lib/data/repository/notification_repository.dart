import 'package:santaclothes/data/model/notification_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

class NotificationRepository {
  Future<NotificationResponse> getNotification(int page) {
    return ApiProvider.instance.getNotification(page, 20);
  }
}
