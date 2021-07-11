import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/notification_item_response.dart';
import 'package:santaclothes/data/remote/model/notification_response.dart';
import 'package:santaclothes/data/repository/notification_repository.dart';
import 'package:santaclothes/utils/constants.dart';

const MAX_COUNT = 20;

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository;

  final notificationResults = Rxn<NotificationResponse>();
  final userName = "".obs;

  NotificationController(this._notificationRepository);

  int currentPage = 0;
  bool hasNextData = true;

  Future<List<NotificationItemResponse>> fetchNotificationApi(
    int currentListSize,
  ) async {
    if (!hasNextData) return [];

    currentPage = currentListSize == 0 ? 0 : currentPage;

    final result = await _notificationRepository
        .getNotification(currentPage, MAX_COUNT)
        .whenComplete(() => currentPage++)
        .catchError((e) {
      Get.back();
      Get.snackbar("알림 정보 불러오기 실패", DEFAULT_ERROR_MSG);
    });

    final notificationItems = result.notificationElements;
    userName.value = result.userName;

    if (notificationItems.isEmpty || notificationItems.length < MAX_COUNT) {
      hasNextData = false;
    }

    return notificationItems;
  }
}
