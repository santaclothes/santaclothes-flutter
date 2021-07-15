import 'package:json_annotation/json_annotation.dart';

part 'home_notice_response.g.dart';

@JsonSerializable()
class HomeNoticesResponse {
  final String content;
  final String hint;
  final String title;

  HomeNoticesResponse(this.content, this.hint, this.title);

  factory HomeNoticesResponse.fromJson(Map<String, dynamic> json) =>
      _$NoticesFromJson(json);

  Map<String, dynamic> toJson() => _$NoticesToJson(this);
}
