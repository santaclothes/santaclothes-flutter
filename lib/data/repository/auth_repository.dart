import 'package:santaclothes/data/local/prefs/token_manager.dart';
import 'package:santaclothes/data/remote/model/token_response.dart';

class AuthRepository {
  Future<void> deleteToken() => TokenManger.instance.deleteUserToken();

  Future<TokenResponse?> getToken() => TokenManger.instance.getUserToken();

  Future<void> setToken(TokenResponse tokenResponse) =>
      TokenManger.instance.setUserToken(tokenResponse);
}
