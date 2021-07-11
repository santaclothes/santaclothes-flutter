import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
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

      File originFile = File(xFile.path);

      File? compressedFile = await _compressAndGetFile(originFile); // 압축한 이미지

      if (compressedFile == null) return;

      await originFile.delete(); // 기존에 촬영한 사진 원본 삭제

      if (tag == CLOTHES_RESULT_TAG) {
        Get.toNamed(Routes.CLOTHES_CAMERA_RESULT,
            arguments: compressedFile.path);
      } else {
        Get.toNamed(Routes.LABEL_CAMERA_RESULT, arguments: compressedFile.path);
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

  Future<File?> _compressAndGetFile(File file) async {
    final dir = await path_provider.getTemporaryDirectory();

    final imageBytes = await file.readAsBytes();
    await file.writeAsBytes(imageBytes);

    final targetFilePath = dir.absolute.path + '/' + _getRandomJpgFileName();

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetFilePath,
      quality: 80,
    );
    return result;
  }

  String _getRandomJpgFileName() {
    return (DateTime.now().millisecondsSinceEpoch + Random().nextInt(1 << 32))
            .toString() +
        ".jpg";
  }
}
