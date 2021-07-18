import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/network/dio_client.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/date_utils.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageClothWidget extends GetView<MyPageController> {
  final int index;

  MyPageClothWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ANALYSIS_RESULTS_FROM_MY_PAGE,
            arguments: {'requestId': controller.myPageClothes[index].clothId});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ReceiptWidget(
            color: Colors.white,
            width: getProportionateScreenWidth(80),
            child: Container(
              child: Column(
                children: [
                  VerticalSpacing(of: 16),
                  Container(
                    color: divideLineColor2,
                    width: getProportionateScreenWidth(45),
                    height: getProportionateScreenWidth(3),
                  ),
                  VerticalSpacing(of: 4),
                  Container(
                    color: divideLineColor3,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(1),
                  ),
                  VerticalSpacing(of: 3),
                  Container(
                    color: divideLineColor3,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(1),
                  ),
                  VerticalSpacing(of: 5),
                  Obx(
                    () => Container(
                      width: getProportionateScreenWidth(62.0),
                      height: getProportionateScreenWidth(62.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          BASE_URL + controller.myPageClothes[index].imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(primaryColor),
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  VerticalSpacing(of: 16),
                ],
              ),
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            convertToOutputFormat(
                controller.myPageClothes[index].requestAt, "yyyy/MM/dd"),
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'nanum_square',
              color: sancleDarkColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
