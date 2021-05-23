import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/prefs/onboarding_manager.dart';
import 'package:santaclothes/data/repository/onboarding_repository.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class OnboardingController extends GetxController {
  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;
  RxString onboardingImage = "assets/images/onboarding_1.png".obs;

  setOnboardingList(index) {
    onboardingImage = onboardingList[index];
  }

  setOnboardingFlag(bool flag) {
    OnboardingRepository().setIsGuide(true);
  }

  final List<RxString> onboardingList =
  [
    RxString('assets/images/onboarding_1.png'),
    RxString('assets/images/onboarding_2.png'),
    RxString('assets/images/onboarding_3.png')
  ];

  final List<Widget> mainPrompt = <Widget>[
    Text.rich(TextSpan(
        text: '옷 세탁법',
        style: TextStyle(
            fontSize: getProportionateScreenHeight(30),
            fontWeight: FontWeight.w700,
            fontFamily: 'nanum_square'),
        children: <TextSpan>[
          TextSpan(
            text: '이 궁금하세요?',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(30),
                fontWeight: FontWeight.w300,
                fontFamily: 'nanum_square'),
          )
        ])),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: '찍힌 라벨',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(30),
                fontWeight: FontWeight.w700,
                fontFamily: 'nanum_square'),
            children: <TextSpan>[
              TextSpan(
                text: '이',
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'nanum_square'),
              )
            ])),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Text(
          '맞는지 확인해주세요',
          style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              fontWeight: FontWeight.w300,
              fontFamily: 'nanum_square'),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '보관함에 라벨을',
          style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              fontWeight: FontWeight.w300,
              fontFamily: 'nanum_square'),
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        Text.rich(TextSpan(
            text: '저장',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(30),
                fontWeight: FontWeight.w700,
                fontFamily: 'nanum_square'),
            children: <TextSpan>[
              TextSpan(
                text: '할 수 있어요',
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'nanum_square'),
              )
            ])),
      ],
    ),
  ].obs;

  final List<Widget> subPrompt = <Widget>[
    Text('카메라 버튼을 눌러 라벨을 찍어보세요',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: getProportionateScreenHeight(16),
            fontFamily: 'nanum_square',
            fontWeight: FontWeight.w300)),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('산클에서 라벨 이미지를 분석하여',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontFamily: 'nanum_square',
                fontWeight: FontWeight.w300)),
        SizedBox(height: getProportionateScreenHeight(10)),
        Text('세탁법과 상세 정보를 알려준답니다!',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontFamily: 'nanum_square',
                fontWeight: FontWeight.w300)),
      ],
    ),
    Text('이전에 찍었던 라벨 정보를 다시 확인할 수 있어요',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: getProportionateScreenHeight(16),
            fontFamily: 'nanum_square',
            fontWeight: FontWeight.w300)),
  ].obs;

  final List<String> buttonPrompt = ['다음', '다음', '시작하기'].obs;

  Widget circleBar(int flag, int index) {
    bool isActive = false;
    if(index == page.value) isActive = true;

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: getProportionateScreenHeight(8),
      width: getProportionateScreenWidth(8),
      decoration: BoxDecoration(
          color: isActive ? pageIndicatorSelectColor : whiteColor,
          border: Border.all(
            color: isActive
                ? pageIndicatorSelectBorderColor
                : pageIndicatorUnselectColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
