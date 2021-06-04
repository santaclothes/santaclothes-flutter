import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_results%20/analysis_results_controller.dart';

class AnalysisResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnalysisResultsController());
  }
}
