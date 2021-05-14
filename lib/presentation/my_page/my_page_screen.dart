import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';

class MyPageScreen extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('마이페이지'),
    );
  }
}
