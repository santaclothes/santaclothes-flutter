import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class ErrorReportScreen extends StatelessWidget {
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
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(
            right: getProportionateScreenWidth(19.0),
          ),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              'assets/icons/ic_close_34.svg',
              height: getProportionateScreenHeight(34),
              width: getProportionateScreenHeight(34),
            ),
          ),
        ),
      ),
      backgroundColor: grayBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
