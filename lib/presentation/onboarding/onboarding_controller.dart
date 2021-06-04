import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/repository/onboarding_repository.dart';
import 'package:santaclothes/presentation/onboarding/widget/onboarding_widget.dart';

class OnboardingController extends GetxController {
  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;
  var main = mainPrompt.obs;
  var sub = subPrompt.obs;
  var button = buttonPrompt.obs;

  /* Onboarding 이미지 */
  RxString onboardingImage = "assets/images/onboarding_1.png".obs;

  final List<RxString> onboardingList = [
    RxString('assets/images/onboarding_1.png'),
    RxString('assets/images/onboarding_2.png'),
    RxString('assets/images/onboarding_3.png')
  ];

  setOnboardingList(index) {
    onboardingImage = onboardingList[index];
  }

  setOnboardingFlag(bool flag) {
    OnboardingRepository().setIsGuide(true);
  }

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }
}
