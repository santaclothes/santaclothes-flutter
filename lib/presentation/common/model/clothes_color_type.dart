import 'package:flutter/material.dart';

enum ClothesColorType {
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  PURPLE,
  BEIGE,
  WHITE,
  GREY,
  BLACK
}

extension ParseToString on ClothesColorType {
  String toShortString() {
    return this.toString().split('.').last;
  }

  Color getColorWidget() {
    switch (this) {
      case ClothesColorType.RED:
        return Color(0xFFFF3939);
      case ClothesColorType.ORANGE:
        return Color(0xFFFFA94D);
      case ClothesColorType.YELLOW:
        return Color(0xFFFFEC66);
      case ClothesColorType.GREEN:
        return Color(0xFF37B24D);
      case ClothesColorType.BLUE:
        return Color(0xFF228BE6);
      case ClothesColorType.PURPLE:
        return Color(0xFF845EF7);
      case ClothesColorType.BEIGE:
        return Color(0xFFECDFCD);
      case ClothesColorType.WHITE:
        return Color(0xFFFFFFFF);
      case ClothesColorType.GREY:
        return Color(0xFFBEBEBE);
      case ClothesColorType.BLACK:
        return Color(0xFF383838);
      default:
        return Color(0xFFECDFCD);
    }
  }

  Color getBorderColorWidget() {
    switch (this) {
      case ClothesColorType.RED:
        return Color(0xFFE61E1E);
      case ClothesColorType.ORANGE:
        return Color(0xFFEF902A);
      case ClothesColorType.YELLOW:
        return Color(0xFFF0DA42);
      case ClothesColorType.GREEN:
        return Color(0xFF397F45);
      case ClothesColorType.BLUE:
        return Color(0xFF2570B1);
      case ClothesColorType.PURPLE:
        return Color(0xFF673EE5);
      case ClothesColorType.BEIGE:
        return Color(0xFFD4C5B0);
      case ClothesColorType.WHITE:
        return Color(0xFFDBDBDB);
      case ClothesColorType.GREY:
        return Color(0xFFA6A6A6);
      case ClothesColorType.BLACK:
        return Color(0xFF383838);
      default:
        return Color(0xFFECDFCD);
    }
  }
}
