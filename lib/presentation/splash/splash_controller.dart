import 'package:get/get.dart';
import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/routes/app_routes.dart';

class SplashController extends GetxController {
  final AuthRepository _authRepository;

  SplashController(this._authRepository);

  @override
  void onReady() {
    super.onReady();
    _checkUserToken();
  }

  _checkUserToken() async {
    final TokenResponse? tokenResponse = await _authRepository.getToken();
    await Future.delayed(Duration(seconds: 2));
    if (tokenResponse == null ||
        DateTime.parse(tokenResponse.expiredAt).millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch) {
      Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.offNamed(Routes.DASHBOARD);
    }
  }
}
