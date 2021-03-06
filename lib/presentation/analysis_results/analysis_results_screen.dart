import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_results/analysis_results_controller.dart';
import 'package:santaclothes/presentation/analysis_results/widget/analysis_results_clothes_body.dart';
import 'package:santaclothes/presentation/analysis_results/widget/analysis_results_header.dart';
import 'package:santaclothes/presentation/analysis_results/widget/analysis_results_label_body.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisResultsScreen extends StatelessWidget {
  final controller = Get.find<AnalysisResultsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 56.0,
        actions: [
          Visibility(
            visible: controller.tag == MY_PAGE_FUNNEL_TAG,
            child: GestureDetector(
              onTap: () => controller.deleteLabelDataFromServer(),
              child: Container(
                margin:
                    EdgeInsets.only(right: getProportionateScreenWidth(17.0)),
                child: SvgPicture.asset('assets/icons/ic_delete.svg'),
              ),
            ),
          ),
        ],
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
                    Visibility(
                      visible: controller.tag == NOTIFICATION_FUNNEL_TAG,
                      child: _bottomButton(
                        title: "?????? ???????????? ??????",
                        onTap: () => controller.saveLabelDataToServer(),
                      ),
                    ),
                    controller.tag == NOTIFICATION_FUNNEL_TAG
                        ? VerticalSpacing(of: 16.0)
                        : VerticalSpacing(of: 0.0),
                    Visibility(
                      visible: controller.tag == NOTIFICATION_FUNNEL_TAG,
                      child: _bottomButton(
                        title: "?????? ???????????? ???????????? ??????",
                        onTap: () => controller.deleteLabelDataFromServer(),
                      ),
                    ),
                    controller.tag == NOTIFICATION_FUNNEL_TAG
                        ? VerticalSpacing(of: 30.0)
                        : VerticalSpacing(of: 80.0)
                  ],
                ),
              ),
      ),
    );
  }

  Widget _bottomButton({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
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
            title,
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
