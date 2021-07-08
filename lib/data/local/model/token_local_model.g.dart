// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenLocalModel _$TokenLocalModelFromJson(Map<String, dynamic> json) {
  return TokenLocalModel(
    json['accessToken'] as String,
    json['expiredAt'] as String,
    json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$TokenLocalModelToJson(TokenLocalModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiredAt': instance.expiredAt,
      'refreshToken': instance.refreshToken,
    };
