import 'package:get/get.dart';
import 'package:santaclothes/presentation/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
