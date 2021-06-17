import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/analysis_request/analysis_request_controller.dart';
import 'package:santaclothes/presentation/common/model/clothes_category.dart';
import 'package:santaclothes/presentation/common/model/clothes_color_type.dart';
import 'package:santaclothes/presentation/common/widget/dotted_line.dart';
import 'package:santaclothes/presentation/common/widget/horizontal_spacing.dart';
import 'package:santaclothes/presentation/common/widget/file_image_border.dart';
import 'package:santaclothes/presentation/common/widget/receipt_widget.dart';
import 'package:santaclothes/presentation/common/widget/vertical_spacing.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

class AnalysisRequestBody extends GetView<AnalysisRequestController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30.0),
            ),
            height: getProportionateScreenHeight(84.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(4.0),
                    bottom: getProportionateScreenHeight(2.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '마지막 STEP',
                        style: TextStyle(
                          color: sancleDark2Color,
                          fontSize: getProportionateScreenHeight(22.0),
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '분석 요청서를 작성하고\n결과를 받아보세요-!',
                        style: TextStyle(
                          color: sancleDark2Color,
                          fontSize: getProportionateScreenHeight(16.0),
                          fontFamily: 'nanum_square',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/bg_sancle_illustration_1.png',
                )
              ],
            ),
          ),
          VerticalSpacing(of: 26.0),
          ReceiptWidget(
            color: Colors.white,
            width: double.infinity,
            child: Container(
              child: Column(
                children: [
                  VerticalSpacing(of: 34.0),
                  Row(
                    children: [
                      HorizontalSpacing(of: 30.0),
                      Obx(
                        () => FileImageBorder(
                          width: getProportionateScreenWidth(74.0),
                          height: getProportionateScreenWidth(74.0),
                          file: File(controller.clothesImagePath.value),
                          borderColor: borderColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderWith: 2.0,
                        ),
                      ),
                      HorizontalSpacing(of: 13.0),
                      Obx(
                        () => FileImageBorder(
                          width: getProportionateScreenWidth(74.0),
                          height: getProportionateScreenWidth(74.0),
                          file: File(controller.labelImagePath.value),
                          borderColor: borderColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderWith: 2.0,
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(of: 30.0),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30.0),
                    ),
                    child: DottedLine(
                      dashColor: dottedLineColor,
                      dashWidth: 5.0,
                      dashHeight: 0.8,
                    ),
                  ),
                  VerticalSpacing(of: 30.0),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '의류 이름',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'nanum_square',
                            color: sancleDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${controller.clothesName.value.length}/20',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'nanum_square',
                              color: sancleGrayDark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpacing(of: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: sancleGrayLight,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30.0)),
                    child: TextField(
                      cursorColor: primaryColor,
                      maxLength: 20,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: sancleDarkColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 12.0,
                        ),
                        isDense: true,
                        border: InputBorder.none,
                        counterText: '',
                        hintText: '의류의 이름을 자유롭게 설정해주세요!',
                        hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: sancleGrayDark,
                        ),
                      ),
                      onChanged: (text) {
                        controller.clothesName.value = text;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(34.0),
                      left: getProportionateScreenWidth(30.0),
                    ),
                    child: Text(
                      '카테 고리',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'nanum_square',
                        color: sancleDarkColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  VerticalSpacing(of: 20.0),
                  _clothesCategory(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(34.0),
                      left: getProportionateScreenWidth(30.0),
                    ),
                    child: Text(
                      '색상',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'nanum_square',
                        color: sancleDarkColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  VerticalSpacing(of: 20.0),
                  _clothesColorType(),
                  VerticalSpacing(of: 52.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clothesCategory() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _clothesCategoryItem(ClothesCategory.TOP),
          _clothesCategoryItem(ClothesCategory.PANTS),
          _clothesCategoryItem(ClothesCategory.SOCKS),
          _clothesCategoryItem(ClothesCategory.UNDERWEAR),
        ],
      ),
    );
  }

  Widget _clothesCategoryItem(ClothesCategory category) {
    return GestureDetector(
      onTap: () => controller.selectedClothesCategory.value = category,
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(9.0),
            horizontal: getProportionateScreenWidth(23.0),
          ),
          decoration: BoxDecoration(
            color: category == controller.selectedClothesCategory.value
                ? primaryColor
                : whiteColor,
            border: Border.all(
              color: category == controller.selectedClothesCategory.value
                  ? primaryColor
                  : borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Text(
            category.getUIValue(),
            style: TextStyle(
              color: category == controller.selectedClothesCategory.value
                  ? whiteColor
                  : sancleDarkColor,
              fontFamily: 'nanum_square',
              fontWeight: FontWeight.w700,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _clothesColorType() {
    return Container(
      height: 48.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(
                left: index == 0
                    ? getProportionateScreenWidth(30.0)
                    : getProportionateScreenWidth(6.0),
                right: index == ClothesColorType.values.length - 1
                    ? getProportionateScreenWidth(30.0)
                    : 0,
              ),
              child: _clothesColorTypeItem(ClothesColorType.values[index]));
        },
        itemCount: ClothesColorType.values.length,
      ),
    );
  }

  Widget _clothesColorTypeItem(ClothesColorType colorType) {
    return GestureDetector(
      onTap: () => controller.selectedClothesColorType.value = colorType,
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(4.0),
          width: 48.0,
          height: 48.0,
          decoration: controller.selectedClothesColorType.value == colorType
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                    width: 2.0,
                  ),
                )
              : null,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorType.getBorderColorWidget(),
                width: 0.6,
              ),
              color: colorType.getColorWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
