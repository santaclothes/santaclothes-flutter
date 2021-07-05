import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/result/result_controller.dart';

class ResultScreen extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('알림 페이지'),
    );
  }
}