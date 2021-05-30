import 'package:flutter/material.dart';
import 'package:santaclothes/presentation/onboarding/widget/onboarding_page_screen.dart';
import 'package:santaclothes/presentation/onboarding/widget/onboaridng_bottom_screen.dart';

class OnboardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: <Widget>[OnboardingPageView(), OnboardingBottomView()],
        ),
      ),
    );
  }
}