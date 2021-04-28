import 'package:get/get.dart';

import 'package:kakao_flutter_sdk/all.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class LoginController extends GetxController {
  bool _isKakaoTalkInstalled = false;

  @override
  void onInit() async {
    _isKakaoTalkInstalled = await isKakaoTalkInstalled();
    super.onInit();
  }

  requestKakaoLogin() async {
    _isKakaoTalkInstalled ? await _loginWithTalk() : await _loginWithKakao();
    try {
      final User user = await UserApi.instance.me();
      final int userId = user.id;
      final String nickname = user.properties?["nickname"] ?? "";
      final String? profileImage = user.properties?["profile_image"];
      /**
       * TODO -1 카카오에서 가져온 사용자 정보 서버로 보내는 작업
       * TODO -2 서버에서 받아온 토큰 정보 SharedPreferences 를 이용해 저장하기
       * */
      Get.offNamed(Routes.DASHBOARD);
    } catch (e) {
      Get.snackbar("로그인 실패", DEFAULT_ERROR_MSG);
    }
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
    } catch (e) {
      throw e;
    }
  }

  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    } catch (e) {
      throw e;
    }
  }

  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      await _loginWithKakao();
    }
  }
}
