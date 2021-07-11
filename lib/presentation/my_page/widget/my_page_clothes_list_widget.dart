import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_cloth_widget.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_clothes_grid_widget.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageClothListWidget extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenHeight(30),
      ),
      width: MediaQuery.of(context).size.width,
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
          Row(
            children: [
              Obx(() => Text(
                    '판별 의류 전체 (${controller.myPageClothes.length})',
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(12),
                        fontWeight: FontWeight.w400,
                        color: sancleDarkColor,
                        fontFamily: 'nanum_square'),
                  )),
              Expanded(child: Container()),
              Obx(
                () => DropdownButton<String>(
                  value: controller.clothCategory.value,
                  items: [
                    for(int i = 0; i < controller.clothCategoryList.length; i++)
                      DropdownMenuItem(
                          value: controller.clothCategoryList.value[i],
                          child: Center(
                              child: Text(
                                controller.clothCategoryList.value[i],
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(12),
                                    fontWeight: FontWeight.w400,
                                    color: sancleDarkColor,
                                    fontFamily: 'nanum_square'),
                              ))),
                  ],
                  hint: Text(
                    '등록일순',
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(12),
                        fontWeight: FontWeight.w400,
                        color: sancleDarkColor,
                        fontFamily: 'nanum_square'),
                  ),
                  onChanged: (String? value) {
                    if (value != null) controller.clothCategory.value = value;
                  },
                ),
              )
            ],
          ),
          VerticalSpacing(of: 30),
          Container(
            color: divideLineColor,
            height: 2,
          ),
          MyPageClothesGirdWidget()
        ],
      ),
    );
  }
}
