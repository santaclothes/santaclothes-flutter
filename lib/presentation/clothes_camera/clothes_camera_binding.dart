import 'package:get/get.dart';
import 'package:santaclothes/presentation/clothes_camera/clothes_camera_controller.dart';

class ClothesCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClothesCameraController>(ClothesCameraController());
  }
}
