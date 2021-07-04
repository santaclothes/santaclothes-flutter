import 'package:get/get.dart';
import 'package:santaclothes/data/model/error_report_response.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
import 'package:santaclothes/presentation/common/model/analysis_status.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class ErrorReportController extends GetxController {
  final AnalysisRepository _analysisRepository;

  final isLoading = true.obs;

  final errorReportResults = Rxn<ErrorReportResponse>();

  int requestId = -1;

  ErrorReportController(this._analysisRepository);

  @override
  void onReady() {
    super.onReady();
    _fetchErrorReportApi();
  }

  void _fetchErrorReportApi() async {
    try {
      requestId = Get.arguments["requestId"];
      if (requestId == -1) {
        Get.back();
        Get.snackbar("화면 전환 실패", DEFAULT_ERROR_MSG);
        return;
      }
      final result =
          await _analysisRepository.getAnalysisRequestReport(requestId);

      errorReportResults.value = result;
      errorReportResults.refresh();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.back();
      Get.snackbar("화면 전환 실패", DEFAULT_ERROR_MSG);
    }
  }

  void requestErrorReport() async {
    try {
      await _analysisRepository.putAnalysisRequest(
          requestId, AnalysisStatus.REPORTED.toShortString());
      Get.until((route) => route.settings.name == Routes.DASHBOARD);
      Get.snackbar('성공', '오류 레포트 보내기 성공!');
    } catch (e) {
      Get.back();
      Get.snackbar("오류 레포트 보내기 실패", DEFAULT_ERROR_MSG);
    }
  }
}
