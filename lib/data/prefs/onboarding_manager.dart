import 'package:santaclothes/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingManager {
  static final OnboardingManager _onboardingGuideManager =
  new OnboardingManager._internal();

  static OnboardingManager get instance => _onboardingGuideManager;

  OnboardingManager._internal();

  Future<void> setIsGuide(bool guided) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ONBOARDING_FLAG, guided);
  }

  Future<bool?> getIsGuide() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(ONBOARDING_FLAG) == null
        ? false
        : prefs.getBool(ONBOARDING_FLAG);
  }
}
