import 'package:get/get.dart';
import 'package:santaclothes/data/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/network/dio_client.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
import 'package:santaclothes/utils/constants.dart';

class AnalysisResultsController extends GetxController {
  final AnalysisRepository _analysisRepository;

  final isLoading = true.obs;

  final analysisResults = Rxn<AnalysisRequestResultResponse>();

  final analysisImageResults = <String>[].obs;

  int requestId = -1;

  AnalysisResultsController(this._analysisRepository);

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
}
