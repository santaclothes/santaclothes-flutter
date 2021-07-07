import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/remote/network/dio_client.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
import 'package:santaclothes/presentation/common/model/analysis_status.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

const String NOTIFICATION_FUNNEL_TAG = "NOTIFICATION_FUNNEL_TAG";
const String MY_PAGE_FUNNEL_TAG = "MY_PAGE_FUNNEL_TAG";

class AnalysisResultsController extends GetxController {
  final AnalysisRepository _analysisRepository;

  final String tag;

  final isLoading = true.obs;

  final analysisResults = Rxn<AnalysisRequestResultResponse>();

  final analysisImageResults = <String>[].obs;

  int requestId = -1;

  AnalysisResultsController(this._analysisRepository, this.tag);

  @override
  void onReady() {
    super.onReady();
    _fetchAnalysisRequestApi();
  }

  void _fetchAnalysisRequestApi() async {
    try {
      requestId = Get.arguments["requestId"];
      if (requestId == -1) {
        Get.back();
        Get.snackbar("화면 전환 실패", DEFAULT_ERROR_MSG);
        return;
      }
      final result = await _analysisRepository.getAnalysisRequest(requestId);

      // 의류 이미지 + 라벨 이미지
      analysisImageResults.add(BASE_URL + result.clothImageUrl);
      analysisImageResults
          .addAll(result.careLabelImageUrls.map((e) => BASE_URL + e));

      analysisResults.value = result;
      analysisResults.refresh();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.back();
      Get.snackbar("화면 전환 실패", DEFAULT_ERROR_MSG);
    }
  }

  void saveLabelDataToServer() {
    _requestAnalysisStatus(AnalysisStatus.DONE.toShortString(), () {
      Get.snackbar('성공', '마이페이지에서 저장한 라벨 정보를 확인하세요!');
    });
  }

  void deleteLabelDataFromServer() {
    _requestAnalysisStatus(AnalysisStatus.DELETED.toShortString(), () {
      Get.snackbar('성공', '삭제가 완료되었습니다.');
    });
  }

  void _requestAnalysisStatus(String status, VoidCallback onSuccess) async {
    try {
      await _analysisRepository.putAnalysisRequest(
          requestId, AnalysisStatus.REPORTED.toShortString());
      Get.until((route) => route.settings.name == Routes.DASHBOARD);
      onSuccess.call();
    } catch (e) {
      Get.snackbar("상태 변경 실패", DEFAULT_ERROR_MSG);
    }
  }
}
