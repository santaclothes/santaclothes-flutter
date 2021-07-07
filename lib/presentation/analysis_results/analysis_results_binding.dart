import 'package:get/get.dart';
import 'package:santaclothes/data/repository/analysis_repository.dart';
import 'package:santaclothes/presentation/analysis_results/analysis_results_controller.dart';

class AnalysisResultsBinding extends Bindings {
  final String tag;

  AnalysisResultsBinding(this.tag);

  @override
  void dependencies() {
    Get.put(AnalysisResultsController(AnalysisRepository(), tag));
  }
}
