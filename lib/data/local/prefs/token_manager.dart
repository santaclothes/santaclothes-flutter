import 'dart:convert';

import 'package:santaclothes/data/local/model/token_local_model.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManger {
  static final TokenManger _userTokenManger = new TokenManger._internal();

  static TokenManger get instance => _userTokenManger;

  TokenManger._internal();

  Future<bool> setUserToken(TokenLocalModel tokenLocalModel) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(PREF_USER_TOKEN, jsonEncode(tokenLocalModel));
  }

  Future<TokenLocalModel?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(PREF_USER_TOKEN);
    if (data != null) {
      Map<String, dynamic> tokenMap = jsonDecode(data) as Map<String, dynamic>;
      return TokenLocalModel.fromJson(tokenMap);
    }
    return null;
  }

  Future<void> deleteUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(PREF_USER_TOKEN);
  }
}
