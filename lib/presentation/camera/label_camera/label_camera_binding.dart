import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/controller/sancle_camera_controller.dart';

class LabelCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SancleCameraController());
  }
}
