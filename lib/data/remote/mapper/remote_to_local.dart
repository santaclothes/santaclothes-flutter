import 'package:santaclothes/data/local/model/token_local_model.dart';
import 'package:santaclothes/data/remote/model/token_response.dart';

extension TokenResponseExtension on TokenResponse {
  TokenLocalModel toTokenLocalModel() {
    return TokenLocalModel(accessToken, expiredAt, refreshToken);
  }
}
