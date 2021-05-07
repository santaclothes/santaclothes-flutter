import 'package:get/get.dart';
import 'package:santaclothes/data/repository/login_repository.dart';
import 'package:santaclothes/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(LoginRepository()));
  }
}
