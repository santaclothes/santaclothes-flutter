import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/local/prefs/firebase_messaging_manager.dart';
import 'package:santaclothes/presentation/dashboard/model/dash_board_tab_type.dart';
import 'package:santaclothes/routes/app_routes.dart';

class DashboardController extends GetxController {
  var currentTabType = DashBoardTabType.HOME.obs;

  @override
  void onReady() async {
    super.onReady();
    await _checkFirebaseMessage();
  }

  _checkFirebaseMessage() async {
    final instance = FirebaseMessagingManager.instance;
    bool existsMessage = await instance.existsFirebaseMessageData() ?? false;
    if (existsMessage == true) {
      Get.toNamed(Routes.NOTIFICATION);
    } else {
      RemoteMessage? message =
          await FirebaseMessaging.instance.getInitialMessage();
      if (message != null) {
        Get.toNamed(Routes.NOTIFICATION);
      }
    }
  }
}
