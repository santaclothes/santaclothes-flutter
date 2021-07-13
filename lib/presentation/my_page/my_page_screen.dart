import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/refresh_widget.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_clothes_list.dart';
import 'package:santaclothes/presentation/my_page/widget/my_page_user_profile.dart';
import 'package:santaclothes/utils/constants.dart';

class MyPageScreen extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: buttonDisableColor,
        appBar: AppBar(
          backgroundColor: grayBackgroundColor,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 56.0,
          automaticallyImplyLeading: false,
        ),
        body: RefreshWidget(
          child: SingleChildScrollView(
            child: Container(
              color: buttonDisableColor,
              child: Column(
                children: <Widget>[
                  // MyPageNoticeWidget(),
                  MyPageUserProfile(),
                  MyPageClothesList()
                ],
              ),
            ),
          ),
          onRefresh: () async {
            await controller.fetchMyPageData();
          },
        ),
      ),
    );
  }
}
