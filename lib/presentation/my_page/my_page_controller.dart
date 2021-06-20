import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/my_page_cloth_data.dart';
import 'package:santaclothes/data/model/my_page_response.dart';
import 'package:santaclothes/data/repository/my_page_repository.dart';
import 'package:santaclothes/presentation/common/widget/circle_bar_widget.dart';

class MyPageController extends GetxController {
  final MyPageRepository _myPageRepository;
  final myClothesCount = 0.obs;
  final myPageClothes = [].obs;
  final userName = "".obs;
  final clothCategory = "등록일순".obs;
  final clothCategoryList = ["등록일순","색상","상의","하의","양말","속옷","수건","케어라벨 수"].obs;
  final filtedClothes = [].obs;

  MyPageController(this._myPageRepository);

  @override
  Future<void> onReady() async {
    MyPageResponse? myPageData = await _myPageRepository.getMyPageData();

    if(myPageData != null){
      myClothesCount.value = myPageData.myClothesCount;
      myPageClothes.value = myPageData.myPageClothes;
      userName.value = myPageData.userName;
      filtedClothes.value = myPageData.myPageClothes;
    }
  }

  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;

  List<List<String>> prompt = [
    [
      '최대 10글자로 타이틀',
      '총 2줄로 어때요?',
      '클릭해서 확인해보세요-!',
    ],
    [
      '최대 10글자로 타이틀',
      '총 2줄로 어때요?',
      '클릭해서 확인해보세요-!',
    ],
    [
      '최대 10글자로 타이틀',
      '총 2줄로 어때요?',
      '클릭해서 확인해보세요-!',
    ]
  ].obs;

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }

  String dateToFormat(int index){
    String origin = myPageClothes.value[index].requestAt;
    String date = origin.split("T")[0].replaceAll('-', '/');

    return date;
  }

  void filter(String category){
    filtedClothes.clear();
    if(category == "등록일순"){
      for(int i = 0; i < myPageClothes.length; i++){
        filtedClothes.add(myPageClothes[i]);
      }
      filtedClothes.sort((a,b) => a.requestAt.compareTo(b.requestAt));
    }
    else if(category == "케어라벨 수"){
      for(int i = 0; i < myPageClothes.length; i++){
        filtedClothes.add(myPageClothes[i]);
      }
    }
    else{
      for(int i = 0; i < myPageClothes.length; i++){
        if(myPageClothes[i] == category){
          filtedClothes.add(myPageClothes[i]);
        }
      }
    }
  }
}