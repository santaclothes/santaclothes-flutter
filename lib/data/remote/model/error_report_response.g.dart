// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorReportResponse _$ErrorReportResponseFromJson(Map<String, dynamic> json) {
  return ErrorReportResponse(
    json['careLabelImageUrl'] as String,
    (json['careLabelDetails'] as List<dynamic>)
        .map(
            (e) => CareLabelDetailsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ErrorReportResponseToJson(
        ErrorReportResponse instance) =>
    <String, dynamic>{
      'careLabelImageUrl': instance.careLabelImageUrl,
      'careLabelDetails': instance.careLabelDetails,
    };
