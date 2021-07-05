import 'package:get/get.dart';
import 'camera_result_controller.dart';

class CameraResultBinding extends Bindings {
  final String tag;

  CameraResultBinding(this.tag);

  @override
  void dependencies() {
    Get.put(CameraResultController(), tag: tag);
  }
}
