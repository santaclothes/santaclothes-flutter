import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('홈화면'),
    );
  }
}