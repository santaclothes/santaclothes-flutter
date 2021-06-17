import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class OnboardingPictureWidget extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Stack(
        children: <Widget>[
          Container(
            child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingList.length,
                onPageChanged: (page) {
                  controller.setOnboardingList(page);
                  controller.page.value = page;
                  controller.pageController.jumpToPage(page);
                },
                itemBuilder: (context, index) {
                  return FittedBox(
                      alignment: Alignment.topCenter,
                      child: Image.asset('${controller.onboardingImage}'),
                      fit: BoxFit.cover);
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(70),
                  right: getProportionateScreenWidth(30)),
              child: TouchableOpacity(
                activeOpacity: 0.6,
                onTap: () {
                  controller.setOnboardingFlag(true);
                  Get.offNamed(Routes.LOGIN);
                },
                child: Text(
                  '건너뛰기',
                  style: TextStyle(color: sancleDarkColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
