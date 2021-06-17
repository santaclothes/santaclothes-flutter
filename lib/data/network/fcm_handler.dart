import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:santaclothes/data/model/fcm_data.dart';
import 'package:santaclothes/data/prefs/fcm_manager.dart';
import 'package:santaclothes/routes/app_routes.dart';

class FcmHandler {
  static final FcmHandler _fcmHandler = FcmHandler._internal();
  static FcmHandler get instance => _fcmHandler;


  FcmHandler._internal();

  firebaseListener() async {

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification; // Forground에서 push noti 잡는 친구
      final android = message.notification?.android;

      if (notification != null && android != null) {
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
            ));
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 앱이 켜졌을 때 push 데이터가 있냐 없냐
    _firebaseTerminateCheck();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("t"); // 앱 실행 후 홈화면 누른 상태에서, Push Noti 왔을 때 눌르면 호출되는 친구
    });
  }

  _firebaseTerminateCheck() async{
    // null인지를 보는지
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();

    // none 대신 null로 변경하기
    FcmData data = FcmData("none",0);

    if(message?.data['category'] != null && message?.data['id'] != null){
      String category = message?.data['category'];
      int id = int.parse(message?.data['id']);
      data = FcmData(category,id);
    }

    FcmManager.instance.setCategory(data);
    // splash에서 Get.offNamed() 없애기
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("back");
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
}