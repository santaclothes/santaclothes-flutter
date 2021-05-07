import 'package:dio/dio.dart';
import 'package:santaclothes/data/network/AuthInterceptor.dart';

const BASE_URL =
    "http://ec2-13-124-105-1.ap-northeast-2.compute.amazonaws.com:8082/";

class DioClient {
  static final Dio defaultClient = _getDefaultClient();
  static final Dio authClient = _getAuthApiClient();

  /// 헤더에 토큰을 담지 않는 API 사용 시 해당 메소드 사용 */
  static Dio _getDefaultClient() {
    final dio = Dio();
    dio.options
      ..baseUrl = BASE_URL
      ..connectTimeout = 60 * 1000
      ..receiveTimeout = 30 * 1000
      ..sendTimeout = 30 * 1000;
    return Dio();
  }

  /// 헤더에 토큰을 담는 API 사용 시 해당 메소드 사용 */
  static Dio _getAuthApiClient() {
    final dio = new Dio();
    dio.options
      ..baseUrl = BASE_URL
      ..connectTimeout = 60 * 1000
      ..receiveTimeout = 30 * 1000
      ..sendTimeout = 30 * 1000;
    dio.interceptors.add(AuthInterceptor(dio));
    return dio;
  }
}
