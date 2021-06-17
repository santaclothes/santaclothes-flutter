import 'package:get/get.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';

import 'analysis_request_controller.dart';

class AnalysisRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnalysisRequestController(AnalysisRepository()));
  }
}
