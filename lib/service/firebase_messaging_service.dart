import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  static final FirebaseMessagingService _fcmHandler =
      FirebaseMessagingService._internal();

  static FirebaseMessagingService get instance => _fcmHandler;

  FirebaseMessagingService._internal();

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling a background message ${message.messageId}');

    // RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    //
    // FcmData data = FcmData("none",0);
    //
    // if(message?.data['category'] != null && message?.data['id'] != null){
    //   String category = message?.data['category'];
    //   int id = int.parse(message?.data['id']);
    //   data = FcmData(category,id);
    // }
    //
    // FcmManager.instance.setCategory(data);
    // Get.offAllNamed(Routes.SPLASH);
  }

  initMessagingSetting() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = AndroidNotificationChannel(
        'sancle_default_channel', // id
        '기본 채널', // title
        '산클 기본 채널', // description
        importance: Importance.max,
      );
      final initSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      final initSettingsIOS = IOSInitializationSettings();
      final initSettings = InitializationSettings(
        android: initSettingsAndroid,
        iOS: initSettingsIOS,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await flutterLocalNotificationsPlugin.initialize(
        initSettings,
        onSelectNotification: (String? payload) async {
          if (payload != null) {
            Map<String, dynamic> dataPayload = json.decode(payload);
          }
        },
      );

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    // Foreground 상태에서 메시지가 왔을 경우
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }
}

// 앱이 켜졌을 때 push 데이터가 있냐 없냐
//   _firebaseTerminateCheck() async {
//     RemoteMessage? message =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     print('dd');
//     // none 대신 null로 변경하기
//     // FcmData data = FcmData("none", 0);
//     //
//     // if (message?.data['category'] != null && message?.data['id'] != null) {
//     //   String category = message?.data['category'];
//     //   int id = int.parse(message?.data['id']);
//     //   data = FcmData(category, id);
//     // }
//     //
//     // FcmManager.instance.setCategory(data);
//     // // splash에서 Get.offNamed() 없애기
//   }
// }
