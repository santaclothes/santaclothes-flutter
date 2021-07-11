import 'package:json_annotation/json_annotation.dart';

import 'care_label_details_response.dart';

part 'analysis_request_result_response.g.dart';

/// clothName : "옷2"
/// howToTitle : "폴리는 물세탁이 가장 좋은 섬유입니다."
/// howToContent : "폴리 특성상 마찰에 의한 보풀이 잘 일어날 수 있는 섬유이기 때문에 손세탁으로 세탁하시면 좋습니다. 세제는 가능하면 중성세제나 약산성 전용세제를 사용하시고, 세탁은 무조건 실온물을 사용하시면 안전합니다."
/// clothImageUrl : "image/e953c6f5-fd2a-48db-81cf-54caff1ed907"
/// careLabelImageUrls : ["image/09dae17f-4b43-4ac6-b8bf-b504689464fc"]
/// careLabelDetails : [{"iconUrl":"/img/waterwash/machine_30.png","name":"FORBIDDEN_KR","description":"물세탁 불가"},{"iconUrl":"/img/dry/ame_flat.png","name":"DRY_CLOUD_HANGER_KR","description":"흐린 날 옷걸이에 걸어서"},{"iconUrl":"/img/drycleaning/ame_drycleaning.png","name":"DRY_CLEANING_FORBIDDEN_KR","description":"드라이 클리닝 불가"},{"iconUrl":"/img/bleach/allno.png","name":"CL_KR","description":"산소, 표백 불가"},{"iconUrl":"/img/ironing/ame_no.png","name":"IRONING_80_120_KR","description":"80~120도 가능"}]
/// createdDate : "2021-06-14T07:09:09.338817Z"

@JsonSerializable(explicitToJson: true)
class AnalysisRequestResultResponse {
  final String userName;
  final String clothName;
  final String howToTitle;
  final String howToContent;
  final String clothImageUrl;
  final List<String> careLabelImageUrls;
  final List<CareLabelDetailsResponse> careLabelDetails;
  final String createdDate;

  AnalysisRequestResultResponse(
    this.userName,
    this.clothName,
    this.howToTitle,
    this.howToContent,
    this.clothImageUrl,
    this.careLabelImageUrls,
    this.careLabelDetails,
    this.createdDate,
  );

  factory AnalysisRequestResultResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalysisRequestResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisRequestResultResponseToJson(this);
}
