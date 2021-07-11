import 'package:santaclothes/data/remote/model/notification_response.dart';
import 'package:santaclothes/data/remote/network/api_provider.dart';

class NotificationRepository {
  Future<NotificationResponse> getNotification(int page, int count) {
    return ApiProvider.instance.getNotification(page, count);
  }
}
