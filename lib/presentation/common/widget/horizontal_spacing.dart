import 'package:flutter/material.dart';
import 'package:santaclothes/utils/size_config.dart';

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    Key? key,
    this.of = 20,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(of),
    );
  }
}
