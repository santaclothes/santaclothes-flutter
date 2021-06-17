import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_request/analysis_request_controller.dart';
import 'package:santaclothes/presentation/analysis_request/widget/analysis_request_body.dart';
import 'package:santaclothes/presentation/common/widget/loading_overlay.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: grayBackgroundColor,
        appBar: AppBar(
          backgroundColor: grayBackgroundColor,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 56.0,
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.bottomRight,
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AnalysisRequestBody(),
              GestureDetector(
                onTap: () {
                  Get.find<AnalysisRequestController>()
                      .requestAnalysis(LoadingOverlay.of(context));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30.0),
                    vertical: getProportionateScreenHeight(36.0),
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
                      '완료',
                      style: TextStyle(
                        color: sancleDarkColor,
                        fontSize: getProportionateScreenHeight(16.0),
                        fontFamily: 'nanum_square',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
