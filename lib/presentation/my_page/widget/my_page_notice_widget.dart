import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/utils/size_config.dart';

class MyPageNoticeWidget extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: getProportionateScreenHeight(128),
          child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.prompt.length,
              onPageChanged: (page) {
                controller.page.value = page;
                controller.pageController.jumpToPage(page);
              },
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(30),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/mypage_illust.png',
                          height: getProportionateScreenHeight(94)),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: getProportionateScreenWidth(220),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(36.0)),
                          Text(
                            controller.prompt[controller.page.value][0],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(22),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'nanum_square'),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10.0)),
                          Text(
                            controller.prompt[controller.page.value][1],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(12.0),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'nanum_square'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(30))
                  ],
                );
              }),
        ),
        Container(
          padding: EdgeInsets.only(
              right: getProportionateScreenWidth(30.0),
              top: getProportionateScreenHeight(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              for (int i = 0; i < controller.prompt.length; i++)
                Obx(()=>controller.getCircleBar(controller.page.value, i))
            ],
          ),
        )
      ],
    );
  }
}
