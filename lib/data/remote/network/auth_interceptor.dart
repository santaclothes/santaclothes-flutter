import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:santaclothes/data/common/sancle_error.dart';
import 'package:santaclothes/data/local/model/token_local_model.dart';
import 'package:santaclothes/data/local/prefs/token_manager.dart';
import 'package:santaclothes/data/remote/mapper/remote_to_local.dart';
import 'package:santaclothes/data/remote/model/token_response.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

import 'dio_client.dart';

/// TODO 테스트 항목
/// 1. TokenManager 에 값이 없을 때 해당 인터셉터 이용해보기
/// 2. access Token 이 만료 됐을 경우 (refresh token 이용한 갱신 로직)
/// 3. refresh Token 이 만료 됐을 경우
/// 4. access Token 갱신 하는 API 오류 났을 때 (가정, url 변경 해보기)
class AuthInterceptor extends Interceptor {
  Dio _dio;

  AuthInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final TokenLocalModel? token = await TokenManger.instance.getUserToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer " + token.accessToken;
      handler.next(options);
    }
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    final TokenLocalModel? token = await TokenManger.instance.getUserToken();
    _dio.interceptors.errorLock.lock();
    if (token == null ||
        error.response == null ||
        error.response?.statusCode != 401) {
      _dio.interceptors.errorLock.unlock();
      handler.next(error);
      return;
    }
    try {
      _dio.interceptors.requestLock.lock();
      final RequestOptions options = error.response!.requestOptions;

      final newTokenResponse = await safeApiCall(() async {
        final response = await _dio.put(BASE_URL + "/auth/accessToken",
            data: jsonEncode({"refreshToken": token.refreshToken}));
        return TokenResponse.fromJson(response.data);
      });
      await TokenManger.instance
          .setUserToken(newTokenResponse.toTokenLocalModel());
      options.headers["Authorization"] =
          "Bearer " + newTokenResponse.accessToken;
      await _dio.fetch(options);
      return;
    } catch (e) {
      if (e is SancleClientException ||
          e is SancleApiException && e.status == 401) {
        await TokenManger.instance.deleteUserToken();
      }
      handler.next(error);
      return;
    } finally {
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.errorLock.unlock();
    }
  }
}
