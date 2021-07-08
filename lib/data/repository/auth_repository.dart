import 'package:santaclothes/data/local/model/token_local_model.dart';
import 'package:santaclothes/data/local/prefs/token_manager.dart';

class AuthRepository {
  Future<void> deleteToken() => TokenManger.instance.deleteUserToken();

  Future<TokenLocalModel?> getToken() => TokenManger.instance.getUserToken();

  Future<void> setToken(TokenLocalModel tokenLocalModel) =>
      TokenManger.instance.setUserToken(tokenLocalModel);
}
