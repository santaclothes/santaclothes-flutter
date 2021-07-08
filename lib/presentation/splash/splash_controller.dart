import 'package:get/get.dart';
import 'package:santaclothes/data/local/model/token_local_model.dart';
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
    final TokenLocalModel? tokenLocalModel = await _authRepository.getToken();
    final bool? onBoardingFlag = await _onboardingRepository.getIsGuide();
    await Future.delayed(Duration(seconds: 2));

    if (tokenLocalModel == null ||
        DateTime.parse(tokenLocalModel.expiredAt).millisecondsSinceEpoch <
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
