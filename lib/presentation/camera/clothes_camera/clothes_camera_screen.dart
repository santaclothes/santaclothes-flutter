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
                    onTap: () async {
                      String? path = await controller.onCameraCaptured();
                      if (path != null) {
                        // TODO 옷 사진 결과 화면 전환
                      }
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

// Widget _cameraBody(
//     CameraController cameraController, Widget cameraButtonSvg) {
//   return Column(
//     children: [
//       Container(
//         child: SizedBox(
//           width: double.infinity,
//           height: getProportionateScreenHeight(666),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(18.0),
//             child: Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   child: CameraPreview(cameraController),
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                         top: getProportionateScreenHeight(21.0),
//                         right: getProportionateScreenWidth(28.0),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: SvgPicture.asset(
//                           'assets/icons/ic_close_normal.svg',
//                           height: getProportionateScreenHeight(32),
//                           width: getProportionateScreenHeight(32),
//                         ),
//                       ),
//                     ),
//                     VerticalSpacing(of: 25.0),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         '정확한 분류를 위해\n옷 전체의 모습을 촬영해 주세요.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           height: 1.4,
//                           fontSize: 12.0,
//                           fontFamily: 'nanum_square',
//                           color: whiteColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     VerticalSpacing(of: 30.0),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SvgPicture.asset(
//                         'assets/images/bg_camera_focus.svg',
//                         height: getProportionateScreenHeight(375.0),
//                       ),
//                     ),
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           margin: EdgeInsets.only(
//                             bottom: getProportionateScreenHeight(8.0),
//                           ),
//                           width: getProportionateScreenHeight(82),
//                           height: getProportionateScreenHeight(82),
//                           child: GestureDetector(
//                             onTapCancel: () {},
//                             onTapDown: (_) {},
//                             onTapUp: (_) {},
//                             onTap: () {
//                               Get.snackbar("촬영", "촬영 시작");
//                             },
//                             child: SvgPicture.asset(
//                               'assets/icons/ic_camera_button_pressed.svg',
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }
}
