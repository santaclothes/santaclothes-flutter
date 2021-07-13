import 'package:flutter/material.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:santaclothes/utils/size_config.dart';

Widget circleBar(int flag, int index) {
  bool isActive = false;
  if(flag == index) isActive = true;

  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 2),
    height: getProportionateScreenHeight(4),
    width: isActive
        ? getProportionateScreenWidth(14)
        : getProportionateScreenWidth(4),
    decoration: BoxDecoration(
        color: isActive ? primaryColor : textDisableColor,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}