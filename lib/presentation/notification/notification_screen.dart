import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/notification/widget/notification_body.dart';
import 'package:santaclothes/presentation/notification/widget/notification_header.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 56.0,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(
            left: getProportionateScreenWidth(17.0),
          ),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              'assets/icons/ic_back_34.svg',
              height: getProportionateScreenHeight(34),
              width: getProportionateScreenHeight(34),
            ),
          ),
        ),
      ),
      backgroundColor: grayBackgroundColor,
      body: Column(
        children: [
          NotificationHeader(),
          VerticalSpacing(of: 26.0),
          Expanded(child: NotificationBody()),
        ],
      ),
    );
  }
}
