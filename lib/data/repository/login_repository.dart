import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/network/auth_provider.dart';
import 'package:santaclothes/data/prefs/token_manager.dart';

class LoginRepository {
  Future<void> postAuthRegister(
      String accountType, String name, String userToken) {
    return AuthProvider.instance.postAuthRegister(accountType, name, userToken);
  }

  Future<bool> postAuthLogin(String userToken) async {
    try {
      TokenResponse tokenResponse =
          await AuthProvider.instance.postAuthLogin(userToken);
      return await TokenManger.instance.setUserToken(tokenResponse);
    } catch (e) {
      throw e;
    }
  }
}
