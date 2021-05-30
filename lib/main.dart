import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  _firebaseListener();
}

_firebaseListener() {
  // App이 Front 상태 일 때
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // TODO Front
  });

  // App이 Background 상태 일 때
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // Noti 클릭 했을 때
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

  });

  // App이 Terminate 상태 일 때
  _firebaseTerminateListner();
}

// Terminate state Handler
_firebaseTerminateListner() async{
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if(initialMessage?.data['type'] == 'chat'){
    
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO Background
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
