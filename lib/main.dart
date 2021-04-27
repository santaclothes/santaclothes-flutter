import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/routes/app_pages.dart';
import 'package:santaclothes/routes/app_routes.dart';

void main() {
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
