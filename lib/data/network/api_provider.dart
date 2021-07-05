import 'dart:io';

import 'package:dio/dio.dart';
import 'package:santaclothes/data/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/network/dio_client.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

/// 산클 메인 서비스에서 사용하는 API 관리 */
class ApiProvider {
  static final ApiProvider _apiProvider = new ApiProvider._internal();

  static ApiProvider get instance => _apiProvider;

  ApiProvider._internal();

  Future<int?> postAnalysisRequest(
    String labelImagePath,
    String clothesImagePath,
    String clothesName,
    String clothesCategory,
    String clothesColorType,
  ) async {
    FormData formData = FormData.fromMap({
      "clothName": clothesName,
      "clothType": clothesCategory,
      "clothColor": clothesColorType,
      "labelImages": await MultipartFile.fromFile(
        labelImagePath,
        filename: labelImagePath,
      ),
      "clothImage": await MultipartFile.fromFile(
        clothesImagePath,
        filename: clothesImagePath,
      ),
    });
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient.post(
          BASE_URL + 'api/analysisRequest',
          data: formData,
        );
      });
      return response.statusCode;
    } catch (e) {
      throw e;
    }
  }

  Future<AnalysisRequestResultResponse> getAnalysisRequest(
    int requestId,
  ) async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient
            .get(BASE_URL + "view/analysisRequest/$requestId");
      });
      return AnalysisRequestResultResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
