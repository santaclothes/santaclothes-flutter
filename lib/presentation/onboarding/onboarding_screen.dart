import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:santaclothes/utils/constants.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: <Widget>[_pageView(), _bottomView()],
        ),
      ),
    );
  }

  Widget _pageView() {
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
                  Get.offNamed(Routes.DASHBOARD);
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

  Widget _bottomView() {
    return Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Column(children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(20)),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    <Widget>[
                      for (int i = 0; i < controller.onboardingList.length; i++)
                          Obx(()=>controller.circleBar(controller.page.value,i))
                    ],
                  ),
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(24)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // _mainPrompt[controller.page.value],
                        Obx(()=>controller.mainPrompt[controller.page.value]),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        Obx(()=>controller.subPrompt[controller.page.value] )
                      ]),
                )),
            Expanded(child: Container()),
            TouchableOpacity(
              activeOpacity: 0.6,
              onTap: () {
                if(controller.page.value < 2){
                  controller.pageController.jumpToPage(++controller.page.value);
                }
                else{
                  Get.offNamed(Routes.DASHBOARD);
                }
              },
              child: Container(
                height: getProportionateScreenHeight(52),
                width: controller.page.value < 2
                    ? getProportionateScreenWidth(120)
                    : getProportionateScreenWidth(142),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 0.5,
                      color: buttonBorderDarkColor,
                    )),
                alignment: Alignment.center,
                child: Wrap(children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(width: getProportionateScreenWidth(16)),
                    Obx(()=>Text(
                      '${controller.buttonPrompt[controller.page.value]}',
                      style: TextStyle(
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w800,
                        color: sancleDarkColor,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    )),
                    SizedBox(width: getProportionateScreenWidth(16)),
                    Container(
                      child: SvgPicture.asset(
                        'assets/icons/arrow_logo.svg',
                        height: getProportionateScreenHeight(16),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(16)),
                  ])
                ]),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            )
          ]),
        ),
      ),
    );
  }
}