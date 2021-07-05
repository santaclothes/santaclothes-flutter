import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_results%20/analysis_results_controller.dart';
import 'package:santaclothes/presentation/analysis_results%20/widget/analysis_results_clothes_body.dart';
import 'package:santaclothes/presentation/analysis_results%20/widget/analysis_results_header.dart';
import 'package:santaclothes/presentation/analysis_results%20/widget/analysis_results_label_body.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisResultsScreen extends StatelessWidget {
  final controller = Get.find<AnalysisResultsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: grayBackgroundColor,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 56.0,
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(17.0),
            ),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/icons/ic_back_34.svg',
                height: getProportionateScreenHeight(34),
                width: getProportionateScreenHeight(34),
              ),
            ),
          ),
        ),
        backgroundColor: grayBackgroundColor,
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryColor)))
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      AnalysisResultsHeader(),
                      VerticalSpacing(of: 26.0),
                      AnalysisResultsClothesBody(),
                      VerticalSpacing(of: 14.0),
                      AnalysisResultsLabelBody(),
                      VerticalSpacing(of: 36.0),
                      _bottomButton(title: "나의 보관함에 저장", onTap: () {}),
                      VerticalSpacing(of: 16.0),
                      _bottomButton(title: "나의 보관함에 저장하지 않기", onTap: () {}),
                      VerticalSpacing(of: 30.0),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _bottomButton({required String title, required VoidCallback onTap}) {
    return Container(
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
          title,
          style: TextStyle(
            color: sancleDarkColor,
            fontSize: getProportionateScreenHeight(16.0),
            fontFamily: 'nanum_square',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
