import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_results/analysis_results_controller.dart';
import 'package:santaclothes/presentation/common/widget/carousel_slider.dart';
import 'package:santaclothes/presentation/common/widget/dotted_line.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/date_utils.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisResultsClothesBody extends GetView<AnalysisResultsController> {
  @override
  Widget build(BuildContext context) {
    return ReceiptWidget(
      width: double.infinity,
      color: Colors.white,
      child: Obx(
        () => controller.analysisResults.value != null
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(of: 34.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: Text(
                        controller.analysisResults.value!.clothName,
                        style: TextStyle(
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w800,
                          fontSize: getProportionateScreenHeight(24.0),
                          color: sancleDarkColor,
                        ),
                      ),
                    ),
                    VerticalSpacing(of: 20.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: Divider(
                        height: 2,
                        color: Color(0xFF4F4F4F),
                        thickness: 2.0,
                      ),
                    ),
                    VerticalSpacing(of: 24.0),
                    _rowText(
                      '요청일시',
                      convertToOutputFormat(
                          controller.analysisResults.value!.createdDate,
                          "yyyy/MM/dd  HH:mma"),
                    ),
                    VerticalSpacing(of: 10.0),
                    _rowText('분석건', '1건'),
                    VerticalSpacing(of: 10.0),
                    _rowText('가맹점명', '산타클로즈'),
                    VerticalSpacing(of: 18.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: DottedLine(
                        dashColor: dottedLineColor,
                        dashWidth: 5.0,
                        dashHeight: 0.8,
                      ),
                    ),
                    VerticalSpacing(of: 26.0),
                    CarouselSlider(controller.analysisImageResults),
                    VerticalSpacing(of: 26.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: DottedLine(
                        dashColor: dottedLineColor,
                        dashWidth: 2.5,
                        dashHeight: 0.8,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(14.0),
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: Text(
                        '관리 방법',
                        style: TextStyle(
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w800,
                          fontSize: getProportionateScreenHeight(18.0),
                          color: sancleDarkColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: DottedLine(
                        dashColor: dottedLineColor,
                        dashWidth: 2.5,
                        dashHeight: 0.8,
                      ),
                    ),
                    VerticalSpacing(of: 20.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: Text(
                        controller.analysisResults.value!.howToTitle,
                        style: TextStyle(
                          height: 1.5,
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w700,
                          fontSize: getProportionateScreenHeight(20.0),
                          color: sancleDarkColor,
                        ),
                      ),
                    ),
                    VerticalSpacing(of: 16.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0),
                      ),
                      child: Text(
                        controller.analysisResults.value!.howToContent,
                        style: TextStyle(
                          height: 1.5,
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w400,
                          fontSize: getProportionateScreenHeight(16.0),
                          color: sancleDarkColor,
                        ),
                      ),
                    ),
                    VerticalSpacing(of: 48.0),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  Widget _rowText(String title, String content) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'nanum_square',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenHeight(14.0),
              color: Color(0xFF868686),
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'nanum_square',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenHeight(14.0),
              color: sancleDark2Color,
            ),
          )
        ],
      ),
    );
  }
}
