import 'package:json_annotation/json_annotation.dart';
import 'package:santaclothes/data/model/my_page_clothes_response.dart';

part 'my_page_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyPageResponse {
  final int myClothesCount;
  final List<MyPageClothesResponse> myPageClothes;
  final String userName;

  MyPageResponse(this.myClothesCount, this.myPageClothes, this.userName);

  factory MyPageResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyPageResponseToJson(this);
}
