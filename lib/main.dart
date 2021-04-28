import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/routes/app_pages.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  KakaoContext.clientId = "57c1c9479dd978197a079c7df2db0905";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
