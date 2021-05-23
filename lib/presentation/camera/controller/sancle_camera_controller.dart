import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class SancleCameraController extends FullLifeCycleController
    with FullLifeCycle {
  CameraController? cameraController;

  bool isInitialized() => cameraController?.value.isInitialized ?? false;

  @override
  void onInit() {
    onCameraInitialized();
    super.onInit();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {
    if (!isInitialized()) return;
    cameraController?.dispose();
  }

  @override
  void onPaused() {}

  @override
  void onResumed() {
    if (!isInitialized()) return;
    onCameraInitialized();
  }

  void onCameraInitialized() async {
    if (cameraController != null) {
      await cameraController?.dispose();
    }
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController = CameraController(camera, ResolutionPreset.ultraHigh,
        enableAudio: false);
    try {
      await cameraController?.initialize();
      update();
    } on CameraException catch (_) {
      _showCameraException();
    }
  }

  void onCameraCaptured(String tag) async {
    final CameraController? controller = cameraController;
    if (controller == null || !this.isInitialized()) {
      _showCameraException();
      return;
    }

    if (controller.value.isTakingPicture) {
      return;
    }

    try {
      final xFile = await controller.takePicture();
      if (tag == CLOTHES_RESULT_TAG) {
        Get.toNamed(Routes.CLOTHES_CAMERA_RESULT, arguments: xFile.path);
      } else {
        Get.toNamed(Routes.LABEL_CAMERA_RESULT, arguments: xFile.path);
      }
    } on CameraException catch (_) {
      _showCameraException();
      return;
    }
  }

  void _showCameraException() {
    Get.snackbar("카메라 에러", DEFAULT_ERROR_MSG);
    Get.back();
  }
}
