import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/prefs/token_manager.dart';

class AuthRepository {
  Future<void> deleteToken() => TokenManger.instance.deleteUserToken();

  Future<TokenResponse?> getToken() => TokenManger.instance.getUserToken();

  Future<void> setToken(TokenResponse tokenResponse) =>
      TokenManger.instance.setUserToken(tokenResponse);
}
