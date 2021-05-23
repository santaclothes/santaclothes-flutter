import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/controller/sancle_camera_controller.dart';
import 'package:santaclothes/presentation/camera/widget/camera_body.dart';
import 'package:santaclothes/utils/constants.dart';

class ClothesCameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: GetBuilder<SancleCameraController>(
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
