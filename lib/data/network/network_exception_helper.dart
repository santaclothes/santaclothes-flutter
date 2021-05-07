import 'package:get/get.dart';
import 'package:santaclothes/data/common/sancle_error.dart';
import 'package:santaclothes/presentation/common/controller/auth_controller.dart';

class NetworkExceptionHelper {
  static const String DEFAULT_SERVER_ERROR_MSG = "잠시 후 다시 시도해주세요.";

  static handleNetworkError(SancleApiException exception,
      {bool showErrorMsg = true}) {
    if (exception.status == 401) {
      Get.find<AuthController>().logout();
    } else {
      if (showErrorMsg) {
        Get.snackbar("네트워크 에러", DEFAULT_SERVER_ERROR_MSG);
      }
    }
  }
}
