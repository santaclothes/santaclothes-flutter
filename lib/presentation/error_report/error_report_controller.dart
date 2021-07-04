import 'package:get/get.dart';
import 'package:santaclothes/data/model/error_report_response.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
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
}
