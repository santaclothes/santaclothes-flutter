import 'package:get/get.dart';
import 'package:santaclothes/data/model/fcm_data.dart';
import 'package:santaclothes/data/prefs/fcm_manager.dart';
import 'package:santaclothes/presentation/dashboard/model/dash_board_tab_type.dart';
import 'package:santaclothes/routes/app_routes.dart';

class DashboardController extends GetxController {
  var currentTabType = DashBoardTabType.HOME.obs;

  @override
  get onStart async {
    FcmData data = await FcmManager.instance.getCategory();

    switch(data.category){
      case "result":
        // TODO 결과 화면으로 라우팅
        // Get.offNamed(Routes.RESULT, argument: data.id);
        break;
      case "notice":
        // TODO 공지 화면으로 라우팅
        // Get.offNamed(Routes.NOTICE, argument: data.id);
        break;
    }

  }
}
