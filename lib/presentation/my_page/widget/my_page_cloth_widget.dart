import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/file_image_border.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageClothWidget extends GetView<MyPageController> {
  int index;

  MyPageClothWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          ReceiptWidget(
            color: Colors.white,
            width: getProportionateScreenWidth(80),
            height: getProportionateScreenHeight(115),
            child: Container(
              child: Column(
                children: [
                  VerticalSpacing(of: 16),
                  Container(
                    color: divideLineColor2,
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenWidth(3),
                  ),
                  VerticalSpacing(of: 4),
                  Container(
                    color: divideLineColor3,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(1),
                  ),
                  VerticalSpacing(of: 4),
                  Container(
                    color: divideLineColor3,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(1),
                  ),
                  // SvgPicture.asset(
                  //   'assets/icons/has_push.svg',
                  //   height: getProportionateScreenHeight(62),
                  // ),
                  VerticalSpacing(of: 4),
                  Obx(
                    () => FileImageBorder(
                      width: getProportionateScreenWidth(62.0),
                      height: getProportionateScreenWidth(62.0),
                      file:
                          File(controller.myPageClothes.value[index].imageUrl),
                      borderColor: borderColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderWith: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalSpacing(of: 10),
          Text(controller.dateToFormat(index),
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'nanum_square',
                color: sancleDarkColor,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}