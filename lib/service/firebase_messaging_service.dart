import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/local/prefs/firebase_messaging_manager.dart';
import 'package:santaclothes/routes/app_routes.dart';

class FirebaseMessagingService {
  static final FirebaseMessagingService _fcmHandler =
      FirebaseMessagingService._internal();

  static FirebaseMessagingService get instance => _fcmHandler;

  FirebaseMessagingService._internal();

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await _onSelectMessage();
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
          await _onSelectMessage();
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

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await _onSelectMessage();
    });
  }

  _onSelectMessage() async {
    final instance = FirebaseMessagingManager.instance;
    await instance.setFirebaseMessageData();
    Get.offAllNamed(Routes.SPLASH);
  }
}
