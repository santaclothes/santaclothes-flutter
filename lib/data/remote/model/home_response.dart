import 'package:json_annotation/json_annotation.dart';
import 'home_notice_response.dart';

part 'home_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeResponse {
  bool hasNewNotification;
  int totalClothesCount;
  String userName;
  List<HomeNoticesResponse> notices;

  HomeResponse(this.hasNewNotification, this.totalClothesCount, this.userName,
      this.notices);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
