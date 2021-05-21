import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/widget/camera_body.dart';
import 'package:santaclothes/utils/constants.dart';

import 'clothes_camera_controller.dart';

class ClothesCameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClothesCameraScreen();
}

class _ClothesCameraScreen extends State<ClothesCameraScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = Get.find<ClothesCameraController>();

    if (!controller.isInitialized()) return;

    if (state == AppLifecycleState.inactive) {
      controller.cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      controller.onCameraInitialized();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: GetBuilder<ClothesCameraController>(
          builder: (controller) {
            return controller.isInitialized()
                ? CameraBody(
                    cameraController: controller.cameraController!,
                    description: '정확한 분류를 위해\n옷 전체의 모습을 촬영해 주세요.',
                    stepTitle: 'STEP 1',
                    stepContent: '옷 전체 촬영',
                    onTap: () {
                      controller.onCameraCaptured();
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
