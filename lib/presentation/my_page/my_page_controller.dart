import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/common/widget/circle_bar_widget.dart';

class MyPageController extends GetxController {
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

  setOnboardingList(index) {
  }

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }
}

