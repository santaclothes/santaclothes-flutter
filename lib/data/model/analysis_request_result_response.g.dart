// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_request_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisRequestResultResponse _$AnalysisRequestResultResponseFromJson(
    Map<String, dynamic> json) {
  return AnalysisRequestResultResponse(
    json['userName'] as String,
    json['clothName'] as String,
    json['howToTitle'] as String,
    json['howToContent'] as String,
    json['clothImageUrl'] as String,
    (json['careLabelImageUrls'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    (json['careLabelDetails'] as List<dynamic>)
        .map(
            (e) => CareLabelDetailsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createdDate'] as String,
  );
}

Map<String, dynamic> _$AnalysisRequestResultResponseToJson(
        AnalysisRequestResultResponse instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'clothName': instance.clothName,
      'howToTitle': instance.howToTitle,
      'howToContent': instance.howToContent,
      'clothImageUrl': instance.clothImageUrl,
      'careLabelImageUrls': instance.careLabelImageUrls,
      'careLabelDetails':
          instance.careLabelDetails.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate,
    };
