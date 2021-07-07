import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/care_label_details_response.dart';
import 'package:santaclothes/data/remote/network/dio_client.dart';
import 'package:santaclothes/presentation/analysis_results/analysis_results_controller.dart';
import 'package:santaclothes/presentation/common/widget/dotted_line.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisResultsLabelBody extends GetView<AnalysisResultsController> {
  @override
  Widget build(BuildContext context) {
    return ReceiptWidget(
      color: Colors.white,
      width: double.infinity,
      child: Obx(
        () => controller.analysisResults.value != null
            ? Container(
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(of: 34.0),
                    Text(
                      '라벨 분석',
                      style: TextStyle(
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w800,
                        fontSize: getProportionateScreenHeight(18.0),
                        color: sancleDarkColor,
                      ),
                    ),
                    VerticalSpacing(of: 14.0),
                    Divider(
                      height: 2,
                      color: Color(0xFF4F4F4F),
                      thickness: 2.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(10.0),
                        bottom: getProportionateScreenHeight(10.0),
                        left: getProportionateScreenWidth(11.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'IMG',
                              style: TextStyle(
                                fontFamily: 'nanum_square',
                                fontWeight: FontWeight.w400,
                                fontSize: getProportionateScreenHeight(14.0),
                                color: sancleDarkColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              '이름',
                              style: TextStyle(
                                fontFamily: 'nanum_square',
                                fontWeight: FontWeight.w400,
                                fontSize: getProportionateScreenHeight(14.0),
                                color: sancleDarkColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                '상세',
                                style: TextStyle(
                                  fontFamily: 'nanum_square',
                                  fontWeight: FontWeight.w400,
                                  fontSize: getProportionateScreenHeight(14.0),
                                  color: sancleDarkColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    DottedLine(
                      dashColor: dottedLineColor,
                      dashWidth: 2.5,
                      dashHeight: 0.8,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller
                            .analysisResults.value!.careLabelDetails.length,
                        itemBuilder: (context, index) {
                          return _buildCareLabelItem(controller
                              .analysisResults.value!.careLabelDetails[index]);
                        }),
                    VerticalSpacing(of: 38.0),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  Widget _buildCareLabelItem(CareLabelDetailsResponse response) {
    return Container(
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(8.0),
        top: getProportionateScreenHeight(24.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.network(
                BASE_URL + response.iconUrl,
                width: getProportionateScreenWidth(32.0),
                height: getProportionateScreenHeight(43.0),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              response.name,
              style: TextStyle(
                fontFamily: 'nanum_square',
                fontWeight: FontWeight.w700,
                fontSize: getProportionateScreenHeight(14.0),
                color: sancleDarkColor,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 8.0),
              child: Text(
                response.description,
                style: TextStyle(
                  height: 1.2,
                  fontFamily: 'nanum_square',
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenHeight(12.0),
                  color: sancleDarkColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
