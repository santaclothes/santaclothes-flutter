import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/dashboard/widget/MainBottomBar.dart';
import 'package:santaclothes/presentation/home/home_screen.dart';
import 'package:santaclothes/presentation/my_page/my_page_screen.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      builder: (controller) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: whiteColor,
            body: Container(
              child: IndexedStack(
                index: controller.currentTabType.value.index,
                children: [
                  HomeScreen(),
                  MyPageScreen(),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              height: getProportionateScreenHeight(76.0),
              width: getProportionateScreenHeight(76.0),
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor: primaryColor,
                child: SvgPicture.asset(
                  "assets/icons/ic_camera.svg",
                  width: getProportionateScreenHeight(32.0),
                  height: getProportionateScreenHeight(32.0),
                ),
              ),
            ),
            bottomNavigationBar: MainBottomBar(),
          ),
        );
      },
    );
  }
}
