import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_controller.dart';
import 'package:santaclothes/presentation/dashboard/model/dash_board_tab_type.dart';

class MainBottomBar extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      color: Colors.white,
      child: Container(
        height: 86.0,
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () =>
                  {controller.currentTabType.value = DashBoardTabType.HOME},
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  controller.currentTabType.value == DashBoardTabType.HOME
                      ? "assets/icons/ic_home_selected.svg"
                      : "assets/icons/ic_home_unselected.svg",
                  width: 28.0,
                  height: 28.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.currentTabType.value = DashBoardTabType.MY_PAGE;
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  controller.currentTabType.value == DashBoardTabType.MY_PAGE
                      ? "assets/icons/ic_my_page_selected.svg"
                      : "assets/icons/ic_my_page_unselected.svg",
                  width: 28.0,
                  height: 28.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
