import 'package:santaclothes/data/local/model/token_local_model.dart';
import 'package:santaclothes/data/remote/model/token_response.dart';

extension TokenLocalModelExtension on TokenLocalModel {
  TokenResponse toTokenResponse() {
    return TokenResponse(accessToken, expiredAt, refreshToken);
  }
}
