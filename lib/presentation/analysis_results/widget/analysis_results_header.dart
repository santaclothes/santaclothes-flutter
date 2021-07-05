import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_results/analysis_results_controller.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisResultsHeader extends GetView<AnalysisResultsController> {
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
                    '분석 결과표',
                    style: TextStyle(
                      color: sancleDark2Color,
                      fontSize: getProportionateScreenHeight(22.0),
                      fontFamily: 'nanum_square',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  VerticalSpacing(of: 16.0),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16.0),
                          color: sancleDark2Color,
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '${controller.analysisResults.value?.userName ?? ''}님의\n',
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${controller.analysisResults.value?.clothName ?? ''}',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(text: ' 결과입니다.')
                        ],
                      ),
                    ),
                  )
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
