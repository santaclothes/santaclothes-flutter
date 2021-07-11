import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';
import 'package:santaclothes/presentation/home/widget/home_notice_widget.dart';
import 'package:santaclothes/presentation/home/widget/home_user_widget.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          top: false,
          child: Stack(children: <Widget>[
            Container(
              child: Obx(() => Image.asset(
                    controller.background.value,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Positioned(
                right: getProportionateScreenWidth(24),
                top: getProportionateScreenHeight(58),
                child: TouchableOpacity(
                  activeOpacity: 0.6,
                  onTap: () => Get.toNamed(Routes.NOTIFICATION),
                  child: Obx(() => SvgPicture.asset(
                        controller.notiIcon.value,
                        width: getProportionateScreenHeight(52),
                        height: getProportionateScreenHeight(52),
                      )),
                )),
            HomeUserWidget(),
            HomeNoticeWidget(),
          ]),
        ));
  }
}
