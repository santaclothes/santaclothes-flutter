import 'package:json_annotation/json_annotation.dart';
import 'package:santaclothes/data/model/care_label_details_response.dart';

part 'error_report_response.g.dart';

/// careLabelImageUrl : "image/74462f2f-197d-4363-8406-6609fef35037"
/// careLabelDetails : [{"iconUrl":"/img/waterwash/machine95.png","name":"WASHER_90_KR","description":"세탁기 95도"},{"iconUrl":"/img/dry/nomachine.png","name":"DRY_MACHINE_FORBIDDEN_KR","description":"건조기 불가"},{"iconUrl":"/img/dryCleaning/noself.png","name":"DRY_CLEANING_SELF_FORBIDDEN_KR","description":"셀프 드라이 클리닝 불가"},{"iconUrl":"/img/bleach/yp.png","name":"CL_BLEACH_KR","description":"염소 표백 가능"},{"iconUrl":"/img/ironing/withcloth180210.png","name":"IRONING_180_210_FABRIC_KR","description":"180~210도 천 깔고만 가능"}]

@JsonSerializable()
class ErrorReportResponse {
  final String careLabelImageUrl;
  final List<CareLabelDetailsResponse> careLabelDetails;

  ErrorReportResponse(this.careLabelImageUrl, this.careLabelDetails);

  factory ErrorReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorReportResponseToJson(this);
}
