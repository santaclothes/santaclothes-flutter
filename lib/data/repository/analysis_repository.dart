import 'dart:io';

import 'package:santaclothes/data/network/api_provider.dart';

class AnalysisRepository {
  Future<int?> postAnalysisRequest(
    String labelImagePath,
    String clothesImagePath,
    String clothesName,
    String clothesCategory,
    String clothesColorType,
  ) async {
    return await ApiProvider.instance.postAnalysisRequest(labelImagePath,
        clothesImagePath, clothesName, clothesCategory, clothesColorType);
  }
}
