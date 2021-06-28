import 'package:get/get.dart';
import 'package:santaclothes/presentation/error_report/error_report_controller.dart';

class ErrorReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ErrorReportController());
  }
}
