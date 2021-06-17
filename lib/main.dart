import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/network/fcm_handler.dart';
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
  FcmHandler.instance.firebaseListener();
  _initNotiSetting();
}

void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );
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
