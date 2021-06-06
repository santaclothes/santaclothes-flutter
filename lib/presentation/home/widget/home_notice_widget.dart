import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';
import 'package:santaclothes/utils/size_config.dart';

class HomeNoticeWidget extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(169),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(17),
                  left: getProportionateScreenWidth(24)),
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < controller.prompt.length; i++)
                    Obx(()=>controller.getCircleBar(controller.page.value, i))
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.prompt.length,
                  onPageChanged: (page) {
                    // propmt 변경
                    controller.page.value = page;
                    controller.pageController.jumpToPage(page);
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(24),
                              right: getProportionateScreenWidth(24),
                              top: getProportionateScreenHeight(18)),
                          child: Text(
                            controller.prompt[controller.page.value][0],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                getProportionateScreenHeight(22),
                                fontWeight: FontWeight.w800,
                                fontFamily: 'nanum_square'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(24),
                              right: getProportionateScreenWidth(24),
                              top: getProportionateScreenHeight(10)),
                          child: Text(
                            controller.prompt[controller.page.value][1],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                getProportionateScreenHeight(12),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'nanum_square'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(24),
                              right: getProportionateScreenWidth(24),
                              top: getProportionateScreenHeight(12)),
                          child: Text(
                            controller.prompt[controller.page.value][2],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                getProportionateScreenHeight(14),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'nanum_square'),
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

}