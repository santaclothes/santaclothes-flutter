import 'package:get/get.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/presentation/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(AuthRepository()));
  }
}
