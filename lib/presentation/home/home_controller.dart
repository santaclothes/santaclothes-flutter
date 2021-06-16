import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/presentation/common/widget/circle_bar_widget.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  final userName = "".obs;
  final clothCount = "0".obs;
  final hasNoti = false.obs;
  final prompt = [].obs;
  final notiIcon = 'assets/icons/no_push.svg'.obs;

  HomeController(this._homeRepository);

  @override
  Future<void> onReady() async {
    HomeResponse? userData = await _homeRepository.getUserData();

    if(userData != null){
      userName.value = userData.userName;
      clothCount.value = countWithComma(userData.totalClothesCount);
      hasNoti.value = userData.hasNewNotification;
      prompt.value = userData.notices;
    }

    if(hasNoti == true){
      notiIcon.value = 'assets/icons/has_push.svg';
    }
    else{
      notiIcon.value = 'assets/icons/no_push.svg';
    }
  }
  
  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }

  String countWithComma(int count){
    String countStr = count.toString().split("").reversed.join("");
    String result = "";

    for(int i = 0; i < countStr.length; i++){
      result = countStr[i] + result;
      if((i+1)%3 == 0 && i != countStr.length-1){
        result = "," + result;
      }
    }

    return result;
  }
}
