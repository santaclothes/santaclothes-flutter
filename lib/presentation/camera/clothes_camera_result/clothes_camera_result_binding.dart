import 'package:get/get.dart';
import 'clothes_camera_result_controller.dart';

class ClothesCameraResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClothesCameraResultController>(ClothesCameraResultController());
  }
}
