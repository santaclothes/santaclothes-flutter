// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return TokenResponse(
    json['accessToken'] as String,
    json['expiredAt'] as String,
    json['refreshToken'] as String,
    json['userToken'] as String,
  );
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiredAt': instance.expiredAt,
      'refreshToken': instance.refreshToken,
      'userToken': instance.userToken,
    };
