import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santaclothes/data/common/sancle_error.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

void main() {
  String _baseUrl =
      "http://ec2-13-124-105-1.ap-northeast-2.compute.amazonaws.com:8082/";
  Dio _dio = Dio();

  group('회원가입 -> 로그인 테스트', () {
    test('회원가입 테스트', () async {
      try {
        String accountType = "KAKAO"; // 소셜 로그인 타입
        String name = "테스트 유저1"; // 사용자 닉네임
        String userToken = "123"; // 사용자 소셜 고유 계정 ID

        Response response = await safeApiCall(() async {
          return await _dio.post(
            _baseUrl + "/auth/register",
            data: jsonEncode({
              "accountType": accountType,
              "name": name,
              "userToken": userToken
            }),
          );
        });

        expect(response.statusCode, 201);
        print('사용자 신규 가입 완료');
      } catch (e) {
        if (e is SancleClientException) {
          print('서버로 잘못된 API 요청');
        } else if (e is SancleApiException) {
          if (e.status == 409) {
            print('이미 가입된 사용자');
          } else {
            print(e.toString());
          }
        } else {
          print(e);
        }
      }
    });
    test('로그인 테스트', () async {
      try {
        String userToken = "550e8400-e29b-41d4-a716-646655441000";
        Response response = await safeApiCall(() async {
          Response response = await _dio.post(
            _baseUrl + "auth/login",
            data: jsonEncode({"userToken": userToken}),
          );
          return response;
        });
        expect(response.statusCode, 200);
        print('토큰 정보 : ${response.data}');
        print('로그인 완료');
      } catch (e) {
        if (e is SancleClientException) {
          print('서버로 잘못된 API 요청');
        } else if (e is SancleApiException) {
          if (e.status == 400) {
            print('존재하지 않는 소셜 아이디');
          } else {
            print(e.toString());
          }
        } else {
          print(e);
        }
      }
    });
  });
}
