import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/clothes_camera_result/clothes_camera_result_controller.dart';
import 'package:santaclothes/presentation/camera/widget/camera_result_body.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

class ClothesCameraResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: GetBuilder<ClothesCameraResultController>(
          builder: (controller) {
            return controller.imagePath.isNotEmpty
                ? CameraResultBody(
                    imagePath: controller.imagePath.value,
                    nextStepText: '다음단계',
                    nextStepOnTap: () {
                      Get.toNamed(Routes.LABEL_CAMERA);
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
