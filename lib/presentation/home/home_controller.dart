import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/home_notice_response.dart';
import 'package:santaclothes/data/remote/model/home_response.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/presentation/home/model/home_background.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  final userName = "".obs;
  final totalClothesCount = "0".obs;
  final hasNewNotification = false.obs;
  final notice = <HomeNoticesResponse>[].obs;
  final homeBackgroundImage = 'assets/images/home_background.png'.obs;
  var noticeCurrentPage = 0.obs;

  final pageController = PageController(
    initialPage: 0,
  );

  HomeController(this._homeRepository);

  @override
  Future<void> onReady() async {
    super.onReady();
    HomeResponse? homeResponse = await _homeRepository.getHomeData();

    if (homeResponse != null) {
      notice.value = homeResponse.notices;
      userName.value = homeResponse.userName;
      totalClothesCount.value = countWithComma(homeResponse.totalClothesCount);
      hasNewNotification.value = homeResponse.hasNewNotification;
    }
    homeBackgroundImage.value = homeBackground[Random().nextInt(4)];
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
