import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class CameraBody extends StatefulWidget {
  final CameraController cameraController;
  final String description;
  final String stepTitle;
  final String stepContent;
  final VoidCallback onTap;

  CameraBody({
    required this.cameraController,
    required this.description,
    required this.stepTitle,
    required this.stepContent,
    required this.onTap,
  });

  @override
  _CameraBodyState createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  String cameraAssetsName = 'assets/icons/ic_camera_button_unpressed.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(666),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: CameraPreview(widget.cameraController),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(21.0),
                          right: getProportionateScreenWidth(28.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/ic_close_normal.svg',
                            height: getProportionateScreenHeight(32),
                            width: getProportionateScreenHeight(32),
                          ),
                        ),
                      ),
                      VerticalSpacing(of: 25.0),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                offset: Offset(0, 1.0),
                                blurRadius: 2.0,
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                              )
                            ],
                            height: 1.4,
                            fontSize: 12.0,
                            fontFamily: 'nanum_square',
                            color: whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      VerticalSpacing(of: 30.0),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/bg_camera_focus.svg',
                          height: getProportionateScreenHeight(375.0),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(8.0),
                            ),
                            width: getProportionateScreenHeight(82),
                            height: getProportionateScreenHeight(82),
                            child: GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  cameraAssetsName =
                                      'assets/icons/ic_camera_button_unpressed.svg';
                                });
                              },
                              onTapDown: (_) {
                                setState(() {
                                  cameraAssetsName =
                                      'assets/icons/ic_camera_button_pressed.svg';
                                });
                              },
                              onTapUp: (_) {
                                setState(() {
                                  cameraAssetsName =
                                      'assets/icons/ic_camera_button_unpressed.svg';
                                });
                              },
                              onTap: () => widget.onTap(),
                              child: SvgPicture.asset(
                                cameraAssetsName,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        VerticalSpacing(of: 20.0),
        Text(
          widget.stepTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'nanum_square',
            color: whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        VerticalSpacing(of: 6.0),
        Text(
          widget.stepContent,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'nanum_square',
            color: whiteColor,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
