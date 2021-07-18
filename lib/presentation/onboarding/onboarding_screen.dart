import 'package:flutter/material.dart';
import 'package:santaclothes/presentation/onboarding/widget/onboarding_picture_widget.dart';
import 'package:santaclothes/presentation/onboarding/widget/onboaridng_content_widget.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            OnboardingPictureWidget(),
            OnboardingContentWidget(),
          ],
        ),
      ),
    );
  }
}
