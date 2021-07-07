import 'package:santaclothes/data/remote/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/remote/model/error_report_response.dart';
import 'package:santaclothes/data/remote/network/api_provider.dart';

class AnalysisRepository {
  Future<int?> postAnalysisRequest(
    String labelImagePath,
    String clothesImagePath,
    String clothesName,
    String clothesCategory,
    String clothesColorType,
  ) async {
    return await ApiProvider.instance.postAnalysisRequest(labelImagePath,
        clothesImagePath, clothesName, clothesCategory, clothesColorType);
  }

  Future<AnalysisRequestResultResponse> getAnalysisRequest(
    int requestId,
  ) async {
    return await ApiProvider.instance.getAnalysisRequest(requestId);
  }

  Future<ErrorReportResponse> getAnalysisRequestReport(
    int requestId,
  ) async {
    return await ApiProvider.instance.getAnalysisRequestReport(requestId);
  }

  Future<void> putAnalysisRequest(int requestId, String status) async {
    return await ApiProvider.instance.putAnalysisRequest(requestId, status);
  }
}
