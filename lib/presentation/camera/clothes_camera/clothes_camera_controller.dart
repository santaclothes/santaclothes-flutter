import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:santaclothes/utils/constants.dart';

class ClothesCameraController extends GetxController {
  CameraController? cameraController;

  bool isInitialized() => cameraController?.value.isInitialized ?? false;

  @override
  void onInit() {
    onCameraInitialized();
    super.onInit();
  }

  void onCameraInitialized() async {
    if (cameraController != null) {
      await cameraController?.dispose();
    }
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController =
        CameraController(camera, ResolutionPreset.max, enableAudio: false);
    try {
      await cameraController?.initialize();
      update();
    } on CameraException catch (_) {
      _showCameraException();
    }
  }

  Future<String?> onCameraCaptured() async {
    final CameraController? controller = cameraController;
    if (controller == null || !this.isInitialized()) {
      _showCameraException();
      return null;
    }

    if (controller.value.isTakingPicture) {
      return null;
    }

    try {
      final xFile = await controller.takePicture();
      return xFile.path;
    } on CameraException catch (_) {
      _showCameraException();
      return null;
    }
  }

  void _showCameraException() {
    Get.snackbar("카메라 에러", DEFAULT_ERROR_MSG);
    Get.back();
  }
}
