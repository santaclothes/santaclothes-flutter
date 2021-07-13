import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_clothes_list_widget.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_notice_widget.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_profile_widget.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MyPageScreen extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonDisableColor,
      appBar: AppBar(
        backgroundColor: grayBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 56.0,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            right: getProportionateScreenWidth(19.0),
          ),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              'assets/icons/back_button.svg',
              height: getProportionateScreenHeight(34),
              width: getProportionateScreenHeight(34),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: buttonDisableColor,
            child: Column(
              children: <Widget>[
                // MyPageNoticeWidget(),
                MyPageProfileWidget(),
                MyPageClothListWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
