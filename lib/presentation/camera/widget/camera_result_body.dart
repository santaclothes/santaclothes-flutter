import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/horizontal_spacing.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class CameraResultBody extends StatelessWidget {
  final String imagePath;
  final String nextStepText;
  final VoidCallback nextStepOnTap;

  CameraResultBody({
    required this.imagePath,
    required this.nextStepText,
    required this.nextStepOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(21.0),
              right: getProportionateScreenWidth(28.0),
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                'assets/icons/ic_close_normal.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenHeight(32),
              ),
            ),
          ),
          VerticalSpacing(of: 25.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.file(
              File(imagePath),
              width: double.infinity,
              height: getProportionateScreenHeight(446.0),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                bottom: getProportionateScreenHeight(25.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRetakeButton(),
                  HorizontalSpacing(of: 23.0),
                  buildNextStepButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRetakeButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: 52.0,
        width: getProportionateScreenWidth(142.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color.fromRGBO(175, 175, 175, 0.5),
        ),
        child: Center(
          child: Text(
            '재촬영',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'nanum_square',
              color: sancleDarkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNextStepButton() {
    return GestureDetector(
      onTap: () => nextStepOnTap(),
      child: Container(
        height: 52.0,
        width: getProportionateScreenWidth(142.0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Color(0x660F1012)),
          borderRadius: BorderRadius.circular(50.0),
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Text(
                nextStepText,
                style: TextStyle(
                  color: sancleDarkColor,
                  fontSize: 16.0,
                  fontFamily: 'nanum_square',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            HorizontalSpacing(of: 16.0),
            Container(
              margin: EdgeInsets.only(
                right: nextStepText == '완료'
                    ? getProportionateScreenWidth(26)
                    : getProportionateScreenWidth(10),
              ),
              child: SvgPicture.asset(
                "assets/icons/ic_next_guide.svg",
                width: getProportionateScreenWidth(26.0),
                height: getProportionateScreenWidth(26.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
