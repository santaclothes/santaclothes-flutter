import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_controller.dart';
import 'package:santaclothes/presentation/camera/controller/sancle_camera_controller.dart';
import 'package:santaclothes/presentation/camera/widget/camera_body.dart';
import 'package:santaclothes/utils/constants.dart';

class LabelCameraScreen extends StatelessWidget {
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
                    description: '올바른 세탁 기호 인식을 위해\n옷 라벨을 가까이 촬영해 주세요.',
                    stepTitle: 'STEP 2',
                    stepContent: '라벨 촬영',
                    onTap: () {
                      controller.onCameraCaptured(LABEL_RESULT_TAG);
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
