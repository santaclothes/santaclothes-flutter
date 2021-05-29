import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_request/model/analysis_request_form.dart';
import 'package:santaclothes/routes/app_routes.dart';

class AnalysisRequestController extends GetxController {
  late AnalysisRequestForm analysisRequestForm;

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments is AnalysisRequestForm) {
      analysisRequestForm = Get.arguments as AnalysisRequestForm;
    } else {
      // 옷 촬영 화면으로 전환하기
      Get.until((Route<dynamic> route) =>
          route.settings.name == Routes.CLOTHES_CAMERA);
    }
  }
}
