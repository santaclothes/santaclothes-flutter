import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/presentation/common/widget/circle_bar_widget.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  final userName = "".obs;
  final clothCount = 0.obs;
  final hasNoti = false.obs;
  final prompt = [].obs;

  HomeController(this._homeRepository);



  @override
  Future<void> onReady() async {
    HomeResponse? userData = await _homeRepository.getUserData();

    if(userData != null){
      userName.value = userData.userName;
      clothCount.value = userData.totalClothesCount;
      hasNoti.value = userData.hasNewNotification;
      prompt.value = userData.notices;
    }
  }

  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;

  // final List<List<String>> prompt = [
  //   [
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
  //     '라벨을 10개 찍으면 상품이 팡!',
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
  //   ],
  //   [
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
  //     '라벨을 10개 찍으면 상품이 팡!',
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
  //   ],
  //   [
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
  //     '라벨을 10개 찍으면 상품이 팡!',
  //     '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
  //   ]
  // ].obs;

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }
}
