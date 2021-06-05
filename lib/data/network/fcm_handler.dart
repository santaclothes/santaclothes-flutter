import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/fcm_data.dart';
import 'package:santaclothes/data/prefs/fcm_manager.dart';
import 'package:santaclothes/routes/app_routes.dart';

class FcmHandler {
  static final FcmHandler _fcmHandler = FcmHandler._internal();
  static FcmHandler get instance => _fcmHandler;

  FcmHandler._internal();

  firebaseListener() {
    // 1. App이 Front 상태 일 때
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // TODO Front
      try{
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text("test")
        ));
      }
      catch(e){
        // TODO context 접근 불가 에러처리
        print(e);
      }
    });

    // 2. App이 Background 상태 일 때
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. App이 Terminate 상태 일 때
    _firebaseTerminateListener();

    // Noti 클릭 했을 때
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // Category 저장하고 SPLASH로 보내기
      FcmData data = FcmData("none",0);

      if(message.data['category'] != null && message.data['id'] != null){
          data = FcmData(message.data['category'],message.data['id']);
      }

      FcmManager.instance.setCategory(data);
      Get.offAllNamed(Routes.SPLASH);
    });
  }

  _firebaseTerminateListener() async{
    // TODO 앱이 꺼져있을 때
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // TODO Background
  }
}