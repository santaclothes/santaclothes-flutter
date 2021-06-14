import 'dart:io';

import 'package:santaclothes/data/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

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
}