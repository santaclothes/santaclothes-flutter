// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return TokenResponse(
    json['accessToken'] as String,
    json['expireDateTime'] as String,
    json['refreshToken'] as String,
    json['userId'] as String,
  );
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expireDateTime': instance.expireDateTime,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
    };
