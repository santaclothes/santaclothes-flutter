import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/login/login_controller.dart';
import 'package:santaclothes/presentation/login/widget/login_button.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/login_background.png",
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: getProportionateScreenHeight(72),
                left: getProportionateScreenWidth(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/sancle_logo_white.png"),
                SizedBox(height: getProportionateScreenHeight(22)),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '간편하게 로그인하고\n서비스를 이용해 보세요',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'nanum_square',
                      color: sancleDarkColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LoginButton(
                iconAssetsName: "assets/icons/ic_kakao_logo.svg",
                backgroundColor: kakaoLoginColor,
                textColor: sancleDarkColor,
                onTab: () {
                  Get.find<LoginController>().requestKakaoLogin();
                },
              ),
              VerticalSpacing(of: 16.0),
              LoginButton(
                iconAssetsName: "assets/icons/ic_apple_logo.svg",
                backgroundColor: blackColor,
                textColor: whiteColor,
                onTab: () {
                  // TODO Apple 로그인
                },
              ),
              GetPlatform.isIOS
                  ? VerticalSpacing(of: 62.0)
                  : VerticalSpacing(of: 28.0),
            ],
          ),
        ],
      ),
    );
  }
}
