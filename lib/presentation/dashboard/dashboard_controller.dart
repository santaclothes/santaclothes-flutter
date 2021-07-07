import 'package:get/get.dart';
import 'package:santaclothes/presentation/dashboard/model/dash_board_tab_type.dart';

class DashboardController extends GetxController {
  var currentTabType = DashBoardTabType.HOME.obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();

    // switch(data.category){
    //   case "result":
    //     // TODO 결과 화면으로 라우팅
    //     Get.offNamed(Routes.RESULT, arguments: data.id);
    //     break;
    //   case "notice":
    //   // TODO 공지 화면으로 라우팅
    //   // Get.offNamed(Routes.NOTICE, arguments: data.id);
    //     break;
    // }
  }
}
