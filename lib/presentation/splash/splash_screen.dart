import 'package:flutter/material.dart';
import 'package:santaclothes/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/images/sancle_logo_full_yellow.png",
            width: getProportionateScreenWidth(250.0),
            height: getProportionateScreenWidth(250.0),
          ),
        ),
      ),
    );
  }
}
