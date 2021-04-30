import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:santaclothes/data/common/sancle_error.dart';

Future<T> safeApiCall<T>(Future<T> Function() requestFunction) async {
  try {
    return await requestFunction();
  } on DioError catch (e) {
    final Response? response = e.response;
    if (response == null || response.statusCode == 404) {
      throw SancleClientException(e.message);
    } else {
      throw SancleApiException.fromJson(
          e.requestOptions.path, e.message, jsonDecode(response.data));
    }
  }
}
