import 'package:get/get.dart';

import 'analysis_request_controller.dart';

class AnalysisRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnalysisRequestController());
  }
}
