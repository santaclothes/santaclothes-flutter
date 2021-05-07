import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/network/dio_client.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

class AuthProvider {
  static final AuthProvider _authProvider = AuthProvider._internal();

  static AuthProvider get instance => _authProvider;

  AuthProvider._internal();

  /// 회원가입 요청 API
  /// statusCode
  /// 201 : 성공
  /// 409 : 이미 존재하는 회원
  /// */
  Future<void> postAuthRegister(
      String accountType, String name, String userToken) async {
    var params = {
      "accountType": accountType,
      "name": name,
      "userToken": userToken
    };
    try {
      await safeApiCall(() async {
        return await DioClient.defaultClient.post(
          BASE_URL + "/auth/register",
          data: params,
        );
      });
    } catch (e) {
      throw e;
    }
  }

  /// 로그인 요청 API
  /// statusCode
  /// 200 : 성공
  /// 400 : 존재하지 않는 소셜 아이디
  /// */
  Future<TokenResponse> postAuthLogin(String userToken) async {
    try {
      Response response = await safeApiCall(() async {
        return await DioClient.defaultClient.post(
          BASE_URL + "auth/login",
          data: jsonEncode({"userToken": userToken}),
        );
      });
      return TokenResponse.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
