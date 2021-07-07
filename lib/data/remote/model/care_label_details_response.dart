import 'package:json_annotation/json_annotation.dart';

part 'care_label_details_response.g.dart';

/// iconUrl : "/img/waterwash/machine_30.png"
/// name : "FORBIDDEN_KR"
/// description : "물세탁 불가"

@JsonSerializable()
class CareLabelDetailsResponse {
  final String iconUrl;
  final String name;
  final String description;

  CareLabelDetailsResponse(this.iconUrl, this.name, this.description);

  factory CareLabelDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CareLabelDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CareLabelDetailsResponseToJson(this);
}
