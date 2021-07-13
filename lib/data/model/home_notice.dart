import 'package:json_annotation/json_annotation.dart';

part 'home_notice.g.dart';

@JsonSerializable()
class Notices {
  final String content;
  final String hint;
  final String title;

  Notices(this.content, this.hint, this.title);

  factory Notices.fromJson(Map<String, dynamic> json) =>
      _$NoticesFromJson(json);

  Map<String, dynamic> toJson() => _$NoticesToJson(this);
}