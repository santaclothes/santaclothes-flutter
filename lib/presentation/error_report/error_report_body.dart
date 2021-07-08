import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/care_label_details_response.dart';
import 'package:santaclothes/data/remote/network/dio_client.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/error_report/error_report_controller.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class ErrorReportBody extends GetView<ErrorReportController> {
  @override
  Widget build(BuildContext context) {
    return ReceiptWidget(
      color: Colors.white,
      allowsTopPaint: false,
      child: Container(
        margin: EdgeInsets.only(top: getProportionateScreenHeight(48.0)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30.0),
              ),
              child: RichText(
                text: TextSpan(
                  text: '잠깐! 촬영한 라벨과\n인신한 라벨이 ',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(24.0),
                    fontFamily: 'nanum_square',
                    color: sancleDarkColor,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: '일치',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '하나요?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacing(of: 20.0),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30.0),
              ),
              child: Text(
                '일치하지 않은 라벨이 있다면 해당하는\n아이콘을 클릭하여 레포트를 보내주세요.',
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14.0),
                  fontFamily: 'nanum_square',
                  color: sancleDarkColor,
                  fontWeight: FontWeight.w300,
                  height: 1.2,
                ),
              ),
            ),
            VerticalSpacing(of: 40.0),
            Obx(
              () => controller.errorReportResults.value != null
                  ? Container(
                      height: getProportionateScreenHeight(110.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller
                            .errorReportResults.value!.careLabelDetails.length,
                        itemBuilder: (context, index) {
                          return _careLabelItem(
                            controller.errorReportResults.value!
                                .careLabelDetails[index],
                            index,
                          );
                        },
                      ),
                    )
                  : Container(),
            ),
            _errorReportButton(),
            VerticalSpacing(of: 28.0),
          ],
        ),
      ),
    );
  }

  Widget _careLabelItem(CareLabelDetailsResponse response, int position) {
    return Container(
      margin: EdgeInsets.only(
        left: position == 0 ? getProportionateScreenWidth(30.0) : 0,
        right: getProportionateScreenWidth(30.0),
      ),
      child: Column(
        children: [
          Image.network(
            BASE_URL + response.iconUrl,
            width: getProportionateScreenWidth(34.0),
            height: getProportionateScreenWidth(34.0),
          ),
          VerticalSpacing(of: 13.0),
          Text(
            response.name,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(12.0),
              fontFamily: 'nanum_square',
              color: sancleDarkColor,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _errorReportButton() {
    return GestureDetector(
      onTap: () => controller.requestErrorReport(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30.0),
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          border: Border.all(
            width: 0.5,
            color: Color.fromRGBO(15, 16, 18, 0.4),
          ),
        ),
        width: double.infinity,
        height: getProportionateScreenHeight(52.0),
        child: Center(
          child: Text(
            '오류 레포트 보내기',
            style: TextStyle(
              color: sancleDarkColor,
              fontSize: getProportionateScreenHeight(16.0),
              fontFamily: 'nanum_square',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
