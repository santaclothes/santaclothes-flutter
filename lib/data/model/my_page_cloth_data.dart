import 'package:json_annotation/json_annotation.dart';

part 'my_page_cloth_data.g.dart';

@JsonSerializable()
class MyPageCloth {
  final int clothId;
  final String clothType;
  final String imageUrl;
  final String requestAt;

  MyPageCloth(this.clothId, this.clothType, this.imageUrl, this.requestAt);

  factory MyPageCloth.fromJson(Map<String, dynamic> json) =>
      _$MyPageClothFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageClothToJson(this);
}