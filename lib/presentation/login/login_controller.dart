import 'package:get/get.dart';

import 'package:kakao_flutter_sdk/all.dart';
import 'package:santaclothes/data/common/sancle_error.dart';
import 'package:santaclothes/data/repository/login_repository.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository;
  bool _isKakaoTalkInstalled = false;

  LoginController(this._loginRepository);

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
      _requestSignUp("KAKAO", nickname, userId.toString());
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

  _requestSignUp(String accountType, String name, String userToken) async {
    try {
      await _loginRepository.postAuthRegister(accountType, name, userToken);
      _requestLogin(userToken);
    } catch (e) {
      if (e is SancleApiException && e.status == 409) {
        // 이미 가입된 사용자 일 경우
        _requestLogin(userToken);
      } else {
        Get.snackbar("로그인 실패", DEFAULT_ERROR_MSG);
      }
    }
  }

  _requestLogin(String userToken) async {
    try {
      bool isLoginSuccess = await _loginRepository.postAuthLogin(userToken);
      if (isLoginSuccess) {
        Get.offNamed(Routes.DASHBOARD);
      } else {
        Get.snackbar("로그인 실패", DEFAULT_ERROR_MSG);
      }
    } catch (e) {
      Get.snackbar("로그인 실패", DEFAULT_ERROR_MSG);
    }
  }
}
