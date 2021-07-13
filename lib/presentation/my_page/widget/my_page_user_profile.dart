import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageUserProfile extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(30),
      ),
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(126),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: Offset(1, 2), blurRadius: 2)
          ]),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Obx(() => Text(
                    '${controller.userName}님',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        fontWeight: FontWeight.w800,
                        fontFamily: 'nanum_square'),
                  )),
              SizedBox(height: getProportionateScreenHeight(12)),
              Text(
                '산클 옷장에 쌓인 옷',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'nanum_square',
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Row(
                children: [
                  Stack(children: [
                    Obx(() => Text(
                          '${controller.myClothesCount}',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'nanum_square',
                              color: whiteColor,
                              decoration: TextDecoration.underline,
                              decorationColor: highlightColor,
                              decorationThickness: 4),
                        )),
                    Obx(() => Text(
                          '${controller.myClothesCount}',
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(14),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'nanum_square',
                          ),
                        )),
                  ]),
                  Text(
                    '벌!',
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(14),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'nanum_square'),
                  )
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
          Image.asset(
            'assets/images/default_profile.png',
            height: getProportionateScreenHeight(78),
            width: getProportionateScreenWidth(78),
          )
        ],
      ),
    );
  }
}
