import 'package:get/get.dart';
import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/data/repository/onboarding_repository.dart';
import 'package:santaclothes/routes/app_routes.dart';

class SplashController extends GetxController {
  final AuthRepository _authRepository;
  final OnboardingRepository _onboardingRepository;

  SplashController(this._authRepository, this._onboardingRepository);

  @override
  void onReady() {
    super.onReady();
    _checkUserToken();
  }

  _checkUserToken() async {
    final TokenResponse? tokenResponse = await _authRepository.getToken();
    final bool? onBoardingFlag = await _onboardingRepository.getIsGuide();
    await Future.delayed(Duration(seconds: 2));

    if (tokenResponse == null ||
        DateTime.parse(tokenResponse.expiredAt).millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch) {
      if (onBoardingFlag == true) {
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.offNamed(Routes.ONBOARDING);
      }
    } else {
      Get.offNamed(Routes.DASHBOARD);
    }
  }
}
