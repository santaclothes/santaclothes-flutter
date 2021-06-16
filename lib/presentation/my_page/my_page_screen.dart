import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MyPageScreen extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonDisableColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: buttonDisableColor,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    TouchableOpacity(
                      activeOpacity: 0.6,
                      child: Container(
                          height: getProportionateScreenHeight(56),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(30)),
                          child:
                              SvgPicture.asset("assets/icons/back_button.svg")),
                      onTap: () {
                        Get.until((Route<dynamic> route) =>
                            route.settings.name == Routes.DASHBOARD);
                      },
                    ),
                    Expanded(child: Container(),),
                    Padding(
                      padding: EdgeInsets.only(right: getProportionateScreenWidth(30)),
                      child: Text("설정",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16.0,
                              fontFamily: 'nanum_square',
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                // _notice(),
                // _profile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
