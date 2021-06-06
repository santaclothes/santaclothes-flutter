import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/home/widget/home_widget.dart';

class HomeController extends GetxController {
  final pageController = PageController(
    initialPage: 0,
  );

  var page = 0.obs;

  final List<List<String>> prompt = [
    [
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
      '라벨을 10개 찍으면 상품이 팡!',
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
    ],
    [
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
      '라벨을 10개 찍으면 상품이 팡!',
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
    ],
    [
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트 8',
      '라벨을 10개 찍으면 상품이 팡!',
      '산타클로즈에 라벨을 쌓아주세요 2줄가이드 라인하이트8'
    ]
  ];

  getCircleBar(int flag, int index) {
    return circleBar(flag, index);
  }
}
