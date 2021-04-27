import 'package:get/get.dart';
import 'package:santaclothes/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offNamed(Routes.LOGIN);
  }
}
