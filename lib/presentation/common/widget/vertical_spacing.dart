import 'package:flutter/material.dart';
import 'package:santaclothes/utils/size_config.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    this.of = 20,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(of),
    );
  }
}
