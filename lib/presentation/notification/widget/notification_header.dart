import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/notification/notification_controller.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class NotificationHeader extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(4.0),
                bottom: getProportionateScreenHeight(2.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '분석 결과 알림',
                    style: TextStyle(
                      color: sancleDark2Color,
                      fontSize: getProportionateScreenHeight(22.0),
                      fontFamily: 'nanum_square',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  VerticalSpacing(of: 16.0),
                  RichText(
                    text: TextSpan(
                      text: '***님의\n',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(16.0),
                        height: 1.5,
                        color: sancleDark2Color,
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: '라벨 분석결과',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        TextSpan(
                          text: '가 완료 되었습니다.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/bg_sancle_illustration_1.png',
          )
        ],
      ),
    );
  }
}
