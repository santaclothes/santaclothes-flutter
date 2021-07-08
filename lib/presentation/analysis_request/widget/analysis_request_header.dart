import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_request/analysis_request_controller.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisRequestHeader extends GetView<AnalysisRequestController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30.0),
      ),
      height: getProportionateScreenHeight(84.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(4.0),
              bottom: getProportionateScreenHeight(2.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '마지막 STEP',
                  style: TextStyle(
                    color: sancleDark2Color,
                    fontSize: getProportionateScreenHeight(22.0),
                    fontFamily: 'nanum_square',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '분석 요청서를 작성하고\n결과를 받아보세요-!',
                  style: TextStyle(
                    color: sancleDark2Color,
                    fontSize: getProportionateScreenHeight(16.0),
                    fontFamily: 'nanum_square',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
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
