import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/remote/model/home_notice_response.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/presentation/home/model/home_background.dart';
import 'package:santaclothes/utils/constants.dart';

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
  void onReady() {
    super.onReady();
    _fetchHomeData();
  }

  void _fetchHomeData() async {
    try {
      final result = await _homeRepository.getHomeData();

      notice.value = result.notices;
      userName.value = result.userName;
      totalClothesCount.value = countWithComma(result.totalClothesCount);
      hasNewNotification.value = result.hasNewNotification;
      homeBackgroundImage.value = homeBackground[Random().nextInt(4)];
    } catch (e) {
      Get.snackbar("홈 정보 가져오기 실패", DEFAULT_ERROR_MSG);
    }
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
