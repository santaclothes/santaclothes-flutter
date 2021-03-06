import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:santaclothes/data/remote/model/analysis_request_result_response.dart';
import 'package:santaclothes/data/remote/model/error_report_response.dart';
import 'package:santaclothes/data/remote/model/home_response.dart';
import 'package:santaclothes/data/remote/model/my_page_response.dart';
import 'package:santaclothes/data/remote/model/notification_response.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

import 'dio_client.dart';

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

  Future<NotificationResponse> getNotification(int page, int size) async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient.get(BASE_URL + "api/notification",
            queryParameters: {"page": page, "size": size});
      });
      return NotificationResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<HomeResponse> getHomeData() async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient.get(
          BASE_URL + "view/home",
        );
      });
      return HomeResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<MyPageResponse> getMyPageData() async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient.get(
          BASE_URL + "view/myPage",
        );
      });
      return MyPageResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<ErrorReportResponse> getAnalysisRequestReport(int requestId) async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.authClient
            .get(BASE_URL + "view/analysisRequest/$requestId/report");
      });
      return ErrorReportResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> putAnalysisRequest(int requestId, String status) async {
    try {
      await safeApiCall(() async {
        await DioClient.authClient.put(
            BASE_URL + "api/analysisRequest/$requestId",
            data: jsonEncode({"status": status}));
      });
    } catch (e) {
      throw e;
    }
  }
}
