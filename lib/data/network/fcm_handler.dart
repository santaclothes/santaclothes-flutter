import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/token_response.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/routes/app_routes.dart';

class FcmHandler{
  static final AuthRepository _authRepository = AuthRepository();

  static firebaseListener() {
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
      final TokenResponse? tokenResponse = await _authRepository.getToken();

      // 로그인 안되어 있다면
      if (tokenResponse == null ||
          DateTime.parse(tokenResponse.expiredAt).millisecondsSinceEpoch <
              DateTime.now().millisecondsSinceEpoch) {
        // TODO 로그인 후 결과 페이지 이동
        // ex) Get.offNamed(Routes.LOGIN, argument : {"result": message.data['id']});
        // LOGIN에 argument 전달 후 argument 있다면 LOGIN에서 Dashboard가 아닌 Result로 이동
        Get.offNamed(Routes.LOGIN);
      }
      // 로그인 되어 있다면
      else{
        // TODO 푸시에 옷 정보가 있다면
        if(message.data['id'] != null){
          // Get.offNamed(Routes.RESULT, argument: initialMessage.data['id']);
        }
        else{
          Get.offNamed(Routes.DASHBOARD);
        }
      }
    });
  }

  static _firebaseTerminateListener() async{
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    final TokenResponse? tokenResponse = await _authRepository.getToken();

    // 로그인 안되어 있다면
    if (tokenResponse == null ||
        DateTime.parse(tokenResponse.expiredAt).millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch) {
      Get.offNamed(Routes.LOGIN);
    }
    // 로그인 되어 있다면
    else{
      // TODO 푸시에 옷 정보가 있다면
      if(initialMessage?.data['id'] != null){
        // Get.offNamed(Routes.RESULT, argument: initialMessage.data['id']);
      }
      else{
        Get.offNamed(Routes.DASHBOARD);
      }
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // TODO Background
  }
}