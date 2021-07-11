import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/network/dio_client.dart';
import 'package:santaclothes/presentation/common/widget/horizontal_spacing.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/error_report/error_report_body.dart';
import 'package:santaclothes/presentation/error_report/error_report_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class ErrorReportScreen extends StatelessWidget {
  final controller = Get.find<ErrorReportController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 56.0,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.centerRight,
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
      backgroundColor: grayBackgroundColor,
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _headerLabelImage(),
                    ErrorReportBody(),
                    VerticalSpacing(of: 42.0),
                    _nextButton(),
                    VerticalSpacing(of: 30.0),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _headerLabelImage() {
    return Container(
      width: Get.size.width,
      height: Get.size.width * 1.2,
      child: Obx(
        () => controller.errorReportResults.value != null
            ? Image.network(
                BASE_URL +
                    controller.errorReportResults.value!.careLabelImageUrl,
                fit: BoxFit.cover,
              )
            : Container(),
      ),
    );
  }

  Widget _nextButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.ANALYSIS_RESULTS_FROM_NOTIFICATION,
          arguments: {'requestId': controller.requestId},
        );
      },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '다음',
              style: TextStyle(
                color: sancleDarkColor,
                fontSize: getProportionateScreenHeight(16.0),
                fontFamily: 'nanum_square',
                fontWeight: FontWeight.w700,
              ),
            ),
            HorizontalSpacing(of: 13.0),
            SvgPicture.asset(
              'assets/icons/ic_next_guide.svg',
              height: getProportionateScreenHeight(23.0),
              width: getProportionateScreenHeight(23.0),
            ),
          ],
        ),
      ),
    );
  }
}
