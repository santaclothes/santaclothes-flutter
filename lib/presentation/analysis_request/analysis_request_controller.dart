import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
import 'package:santaclothes/presentation/analysis_request/model/analysis_request_form.dart';
import 'package:santaclothes/presentation/common/model/clothes_category.dart';
import 'package:santaclothes/presentation/common/model/clothes_color_type.dart';
import 'package:santaclothes/presentation/common/widget/loading_overlay.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class AnalysisRequestController extends GetxController {
  final AnalysisRepository _analysisRepository;

  final labelImagePath = ''.obs;
  final clothesImagePath = ''.obs;
  final clothesName = ''.obs;
  final selectedClothesCategory = ClothesCategory.TOP.obs;
  final selectedClothesColorType = ClothesColorType.RED.obs;

  AnalysisRequestController(this._analysisRepository);

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

  void requestAnalysis(LoadingOverlay overlay) async {
    if (clothesName.value.isEmpty) {
      Get.snackbar('오류', '의류 이름을 입력해주세요.');
    } else {
      try {
        int? statusCode = await overlay.during(
          _analysisRepository.postAnalysisRequest(
              labelImagePath.value,
              clothesImagePath.value,
              clothesName.value,
              selectedClothesCategory.value.toShortString(),
              selectedClothesColorType.value.toShortString()),
        );
        if (statusCode == 201) {
          // TODO 최종 화면(광고?)으로 전환
        } else {
          Get.snackbar('요청 실패', DEFAULT_ERROR_MSG);
        }
      } catch (e) {
        Get.snackbar("실패", e.toString());
      } finally {}
    }
  }
}
