import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';
import 'package:santaclothes/utils/size_config.dart';

class HomeUserWidget extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenHeight(70),
          left: getProportionateScreenWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(()=>Text.rich(
          TextSpan(
              text: controller.userName.value,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(28),
                  fontWeight: FontWeight.w800,
                  fontFamily: 'nanum_square'),
              children: <TextSpan>[
                TextSpan(
                  text: '님,',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(28),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'nanum_square'),
                )
              ]))
          ),
          SizedBox(height: getProportionateScreenHeight(12)),
          Text(
            '안녕하세요!',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(28),
                fontWeight: FontWeight.w300,
                fontFamily: 'nanum_square'),
          ),
          SizedBox(height: getProportionateScreenHeight(32)),
          Text(
            '현재 산타클로즈에 쌓인 옷',
            style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.w400,
                fontFamily: 'nanum_square'),
          ),
          SizedBox(height: getProportionateScreenHeight(8)),
          Obx(()=>Text(
            "${controller.clothCount.value}",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
                fontWeight: FontWeight.w800,
                fontFamily: 'nanum_square'),
          )),
        ],
      ),
    );
  }

}