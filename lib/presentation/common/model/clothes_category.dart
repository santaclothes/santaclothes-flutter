enum ClothesCategory { TOP, PANTS, SOCKS, UNDERWEAR }

extension ParseToString on ClothesCategory {
  String toShortString() {
    return this.toString().split('.').last;
  }

  String getUIValue() {
    switch (this) {
      case ClothesCategory.TOP:
        return '상의';
      case ClothesCategory.PANTS:
        return '하의';
      case ClothesCategory.SOCKS:
        return '양말';
      case ClothesCategory.UNDERWEAR:
        return '속옷';
      default:
        return "";
    }
  }
}
