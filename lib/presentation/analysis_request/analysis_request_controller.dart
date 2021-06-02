import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_request/model/analysis_request_form.dart';
import 'package:santaclothes/presentation/common/model/clothes_category.dart';
import 'package:santaclothes/presentation/common/model/clothes_color_type.dart';
import 'package:santaclothes/routes/app_routes.dart';

class AnalysisRequestController extends GetxController {
  final labelImagePath = ''.obs;
  final clothesImagePath = ''.obs;
  final clothesName = ''.obs;
  final selectedClothesCategory = ClothesCategory.TOP.obs;
  final selectedClothesColorType = ClothesColorType.RED.obs;

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments is AnalysisRequestForm) {
      final analysisRequestForm = Get.arguments as AnalysisRequestForm;
      labelImagePath.value = analysisRequestForm.labelImagePath;
      clothesImagePath.value = analysisRequestForm.clothesImagePath;
    } else {
      // 옷 촬영 화면으로 전환하기
      Get.until((Route<dynamic> route) =>
          route.settings.name == Routes.CLOTHES_CAMERA);
    }
  }

  void requestAnalysis() {
    // TODO 값 유효성 검사 및 네트워크 통신 후 로딩 화면으로 전환
  }
}
