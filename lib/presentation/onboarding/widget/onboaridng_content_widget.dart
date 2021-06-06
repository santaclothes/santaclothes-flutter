import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class OnboardingContentWidget extends GetView<OnboardingController>{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
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
                        Obx(()=>controller.getCircleBar(controller.page.value,i))
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
                        Obx(()=>controller.main[controller.page.value]),
                        SizedBox(height: getProportionateScreenHeight(24)),
                        Obx(()=>controller.sub[controller.page.value])
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
                  controller.setOnboardingFlag(true);
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
                      '${controller.button[controller.page.value]}',
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