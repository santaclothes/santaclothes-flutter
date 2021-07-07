import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

/// accessToken : "2fc85855-0480-472e-9d68-8f3cb8affd78"
/// refreshToken : "4d214b30-469b-448c-8c92-4d37290e3333"
/// expireDateTime : "2021-01-30T10:26:28.890Z"
/// userToken : "asdf"

@JsonSerializable()
class TokenResponse {
  final String accessToken;
  final String expiredAt;
  final String refreshToken;

  TokenResponse(
      this.accessToken, this.expiredAt, this.refreshToken);

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}