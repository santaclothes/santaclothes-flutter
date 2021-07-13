import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/dotted_line.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_cloth_widget.dart';
import 'package:santaclothes/utils/constants.dart';

class MyPageClothesGirdWidget extends GetView<MyPageController> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              for (int i = 0;
                  i < getDivide(controller.myPageClothes.length).quotient;
                  i++)
                Column(
                  children: [
                    Row(
                      children: [
                        for (int j = 0; j < 3; j++) MyPageClothWidget(index++)
                      ],
                    ),
                    DottedLine(
                      dashColor: dottedLineColor,
                      dashWidth: 5.0,
                      dashHeight: 0.8,
                    ),
                  ],
                ),
              Row(
                children: [
                  for (int j = 0;
                      j < getDivide(controller.myPageClothes.length).mod;
                      j++)
                    MyPageClothWidget(index++)
                ],
              ),
            ],
          ),
        ));
  }

  Divide getDivide(int length) {
    int quotient = 0;
    int mod = 0;

    mod = length % 3;
    quotient = ((length - mod) / 3).toInt();

    return Divide(quotient, mod);
  }
}

class Divide {
  int quotient;
  int mod;

  Divide(this.quotient, this.mod);
}
