import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:santaclothes/service/firebase_messaging_service.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/presentation/common/controller/auth_controller.dart';
import 'package:santaclothes/routes/app_pages.dart';
import 'package:santaclothes/routes/app_routes.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initialize();
  runApp(MyApp());
}

_initialize() async {
  KakaoContext.clientId = "57c1c9479dd978197a079c7df2db0905";
  await FirebaseMessagingService.instance.initMessagingSetting();
  Get.lazyPut(() => AuthController(AuthRepository()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
