import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/camera/widget/camera_result_body.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';

import 'camera_result_controller.dart';

class CameraResultScreen extends StatelessWidget {
  final String tag;

  CameraResultScreen({required this.tag});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: GetBuilder<CameraResultController>(
          tag: tag,
          builder: (controller) {
            return controller.imagePath.isNotEmpty
                ? CameraResultBody(
                    imagePath: controller.imagePath.value,
                    nextStepText: tag == CLOTHES_RESULT_TAG ? '다음단계' : '완료',
                    nextStepOnTap: () {
                      if (tag == CLOTHES_RESULT_TAG) {
                        Get.toNamed(Routes.LABEL_CAMERA);
                      } else {
                        final labelImagePath = Get.find<CameraResultController>(
                                tag: LABEL_RESULT_TAG)
                            .imagePath
                            .value;
                        final clothesImagePath =
                            Get.find<CameraResultController>(
                                    tag: CLOTHES_RESULT_TAG)
                                .imagePath
                                .value;
                        Get.toNamed(
                          Routes.ANALYSIS_REQUEST,
                          arguments: {
                            'labelImagePath': labelImagePath,
                            'clothesImagePath': clothesImagePath
                          },
                        );
                      }
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
