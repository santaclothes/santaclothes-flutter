import 'package:get/get.dart';
import 'package:santaclothes/data/model/fcm_data.dart';
import 'package:santaclothes/data/prefs/fcm_manager.dart';
import 'package:santaclothes/presentation/dashboard/model/dash_board_tab_type.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'dart:developer' as developer;

class DashboardController extends GetxController {
  var currentTabType = DashBoardTabType.HOME.obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    FcmData data = await FcmManager.instance.getCategory();
    developer.log('data : ${data.category}', name: 'fcm');

    switch(data.category){
      case "result":
        // TODO 결과 화면으로 라우팅
        Get.offNamed(Routes.RESULT, arguments: data.id);
        break;
      case "notice":
      // TODO 공지 화면으로 라우팅
      // Get.offNamed(Routes.NOTICE, arguments: data.id);
        break;
    }
  }
}
