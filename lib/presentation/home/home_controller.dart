import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/presentation/common/widget/circle_bar_widget.dart';
import 'package:santaclothes/presentation/home/model/home_background.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  final userName = "".obs;
  final clothCount = "0".obs;
  final hasNoti = false.obs;
  final notice = [].obs;
  final notiIcon = 'assets/icons/no_push.svg'.obs;
  final background = 'assets/images/home_background.png'.obs;
  var page = 0.obs;

  HomeController(this._homeRepository);

  @override
  Future<void> onReady() async {
    super.onReady();
    HomeResponse? homeResponse = await _homeRepository.getHomeData();

    if (homeResponse != null) {
      notice.value = homeResponse.notices;
      userName.value = homeResponse.userName;
      clothCount.value = countWithComma(homeResponse.totalClothesCount);
      hasNoti.value = homeResponse.hasNewNotification;
    }

    if (hasNoti.value == true) {
      notiIcon.value = 'assets/icons/has_push.svg';
    } else {
      notiIcon.value = 'assets/icons/no_push.svg';
    }

    randomBackground();
  }

  final pageController = PageController(
    initialPage: 0,
  );

  void randomBackground() {
    int rand = Random().nextInt(4);
    background.value = homeBackground[rand];
  }

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }

  String countWithComma(int count) {
    String countStr = count.toString().split("").reversed.join("");
    String result = "";

    for (int i = 0; i < countStr.length; i++) {
      result = countStr[i] + result;
      if ((i + 1) % 3 == 0 && i != countStr.length - 1) {
        result = "," + result;
      }
    }

    return result;
  }
}
