import 'package:json_annotation/json_annotation.dart';

part 'token_local_model.g.dart';

@JsonSerializable()
class TokenLocalModel {
  final String accessToken;
  final String expiredAt;
  final String refreshToken;

  TokenLocalModel(this.accessToken, this.expiredAt, this.refreshToken);

  factory TokenLocalModel.fromJson(Map<String, dynamic> json) =>
      _$TokenLocalModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenLocalModelToJson(this);
}
