import 'package:json_annotation/json_annotation.dart';

part 'my_page_clothes_response.g.dart';

@JsonSerializable()
class MyPageClothesResponse {
  final int careLabelCount;
  final int clothId;
  final String clothType;
  final String imageUrl;
  final String requestAt;

  MyPageClothesResponse(this.careLabelCount, this.clothId, this.clothType,
      this.imageUrl, this.requestAt);

  factory MyPageClothesResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPageClothFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageClothToJson(this);
}
