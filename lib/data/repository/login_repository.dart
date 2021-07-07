import 'package:santaclothes/data/local/prefs/token_manager.dart';
import 'package:santaclothes/data/remote/model/token_response.dart';
import 'package:santaclothes/data/remote/network/auth_provider.dart';

class LoginRepository {
  Future<void> postAuthRegister(
      String accountType, String name, String userToken) {
    return AuthProvider.instance.postAuthRegister(accountType, name, userToken);
  }

  Future<bool> postAuthLogin(String userToken, String deviceToken) async {
    try {
      TokenResponse tokenResponse =
          await AuthProvider.instance.postAuthLogin(userToken, deviceToken);
      return await TokenManger.instance.setUserToken(tokenResponse);
    } catch (e) {
      throw e;
    }
  }
}
