import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_cloth_widget.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageClothesList extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(30),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: Offset(1, 2), blurRadius: 2)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VerticalSpacing(of: 30),
          Text(
            '판별한 의류',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                fontWeight: FontWeight.w800,
                fontFamily: 'nanum_square'),
          ),
          VerticalSpacing(of: 12),
          Obx(
            () => Text(
              '판별 의류 전체 (${controller.myPageClothes.length})',
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(12),
                  fontWeight: FontWeight.w400,
                  color: sancleDarkColor,
                  fontFamily: 'nanum_square'),
            ),
          ),
          VerticalSpacing(of: 24),
          Container(
            color: divideLineColor,
            height: 2,
          ),
          VerticalSpacing(of: 30),
          Obx(() => controller.myPageClothes.isEmpty
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(30),
                  ),
                  child: Center(
                    child: Text(
                      '저장된 의류가 없습니다.',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'nanum_square',
                        color: sancleDarkColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.7),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.myPageClothes.length,
                  itemBuilder: (context, index) {
                    return MyPageClothWidget(index);
                  },
                ))
        ],
      ),
    );
  }
}
