import 'package:santaclothes/data/local/prefs/onboarding_manager.dart';

class OnboardingRepository {
  Future<bool?> getIsGuide() => OnboardingManager.instance.getIsGuide();

  Future<void> setIsGuide(bool guide) =>
      OnboardingManager.instance.setIsGuide(guide);
}
