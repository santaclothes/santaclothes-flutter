import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/presentation/common/controller/auth_controller.dart';
import 'package:santaclothes/routes/app_pages.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initialize();
  runApp(MyApp());
}

_initialize() async {
  KakaoContext.clientId = "57c1c9479dd978197a079c7df2db0905";
  Get.lazyPut(() => AuthController(AuthRepository()));
  await Firebase.initializeApp();
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
