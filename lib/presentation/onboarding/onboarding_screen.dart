import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:santaclothes/utils/constants.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  final _pageController = PageController(
    initialPage: 0,
  );
  var _page = 0;

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
                controller: _pageController,
                itemCount: _onbordingList.length,
                onPageChanged: (page) {
                  controller.setOnboardingList(page);
                  controller.page.value = page;
                  _pageController.jumpToPage(page);
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
                    children: <Widget>[
                      for (int i = 0; i < _onbordingList.length; i++)
                        if (i == controller.page.value) ...[_circleBar(true)] else
                          _circleBar(false),
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
                        controller.mainPrompt[controller.page.value],
                        SizedBox(height: getProportionateScreenHeight(24)),
                        Obx(()=>_subPrompt[controller.page.value] )
                      ]),
                )),
            Expanded(child: Container()),
            TouchableOpacity(
              activeOpacity: 0.6,
              onTap: () {
                if(controller.page.value < 2){
                  _pageController.jumpToPage(++controller.page.value);
                }
                else{
                  Get.offNamed(Routes.DASHBOARD);
                }
              },
              child: Container(
                height: getProportionateScreenHeight(52),
                width: _page < 2
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
                    Text(
                      '${_buttonPrompt[_page]}',
                      style: TextStyle(
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w800,
                        color: sancleDarkColor,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
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

  final List<Widget> _onbordingList = <Widget>[
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_1.png'),
        fit: BoxFit.cover),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_2.png'),
        fit: BoxFit.cover),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_3.png'),
        fit: BoxFit.cover),
  ];

  final List<Widget> _mainPrompt = <Widget>[
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
  ];

  final List<Widget> _subPrompt = <Widget>[
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
  ];

  final List<String> _buttonPrompt = ['다음', '다음', '시작하기'];

  Widget _circleBar(bool isActive) {
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
/*


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController(
    initialPage: 0,
  );
  var _page = 0;

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
                controller: _pageController,
                itemCount: _onbordingList.length,
                onPageChanged: (page) {
                  print('page : ${page}');
                  Get.find<OnboardingController>().setOnboardingList(page);
                  _page = page;
                  _pageController.jumpToPage(page);
                },
                itemBuilder: (context, index) {
                  print('image : ${Get.find<OnboardingController>().onboardingImage}');
                  // return FittedBox(
                  //     alignment: Alignment.topCenter,
                  //     // child: Image.asset('${Get.find<OnboardingController>().onboardingImage}'),
                  //     fit: BoxFit.cover);
                  return _onbordingList[index];
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
          width: MediaQuery.of(context).size.width,
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
                    children: <Widget>[
                      for (int i = 0; i < _onbordingList.length; i++)
                        if (i == _page) ...[_circleBar(true)] else
                          _circleBar(false),
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
                        _mainPrompt[_page],
                        SizedBox(height: getProportionateScreenHeight(24)),
                        _subPrompt[_page]
                      ]),
                )),
            Expanded(child: Container()),
            TouchableOpacity(
              activeOpacity: 0.6,
              onTap: () {
                if(_page < 2){
                  _pageController.jumpToPage(++_page);
                }
                else{
                  Get.offNamed(Routes.DASHBOARD);
                }
              },
              child: Container(
                height: getProportionateScreenHeight(52),
                width: _page < 2
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
                    Text(
                      '${_buttonPrompt[_page]}',
                      style: TextStyle(
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w800,
                        color: sancleDarkColor,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
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

  final List<Widget> _onbordingList = <Widget>[
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_1.png'),
        fit: BoxFit.cover),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_2.png'),
        fit: BoxFit.cover),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/onboarding_3.png'),
        fit: BoxFit.cover),
  ];

  final List<Widget> _mainPrompt = <Widget>[
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
  ];

  final List<Widget> _subPrompt = <Widget>[
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
  ];

  final List<String> _buttonPrompt = ['다음', '다음', '시작하기'];

  Widget _circleBar(bool isActive) {
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
*/
