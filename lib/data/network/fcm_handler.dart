import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

    // 1. App이 Front 상태 일 때
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
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
                // other properties...
              ),
            ));
      }
    });

    // 2. App이 Background 상태 일 때
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. App이 Terminate 상태 일 때
    // _firebaseTerminateListener();

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    // });
  }

  void _setting(RemoteMessage message) async{
    final notiTitle = 'title';
    final notiDesc = 'description';
    var android = AndroidNotificationDetails('id', notiTitle, notiDesc,
        importance: Importance.max, priority: Priority.max);
    var platform = NotificationDetails(android: android);
    print("show");
    print("${message.notification!.body}");
    await FlutterLocalNotificationsPlugin().show(0, "message.notification!.title", "message.notification!.body", platform);
  }

  // _firebaseTerminateListener() async{
  //   // TODO 앱이 꺼져있을 때
  //   RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  //
  //   FcmData data = FcmData("none",0);
  //
  //   if(message?.data['category'] != null && message?.data['id'] != null){
  //     String category = message?.data['category'];
  //     int id = int.parse(message?.data['id']);
  //     data = FcmData(category,id);
  //   }
  //
  //   FcmManager.instance.setCategory(data);
  //   Get.offAllNamed(Routes.SPLASH);
  // }

  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // }
}