import 'package:dio/dio.dart';
import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/network/dio_client.dart';
import 'package:santaclothes/data/utils/api_utils.dart';

class HomeProvider {
  static final HomeProvider _homeProvider = HomeProvider._internal();

  static HomeProvider get instance => _homeProvider;

  HomeProvider._internal();

  /// Home 화면 정보 요청 API
  /// statusCode
  /// 201 : 성공
  /// */
  Future<HomeResponse?> getUserData() async {
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
}