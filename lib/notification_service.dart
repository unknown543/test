import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_test/main.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('ic_launcher');

  static const InitializationSettings initializationSettings =
  InitializationSettings(
    android: initializationSettingsAndroid,
  );

  void init(BuildContext context) async {
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    String? str = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((event) async {
      try {
        debugPrint(event.notification?.title.toString());
        debugPrint(event.data["test"]);
    showLocalNotification(event);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      await Firebase.initializeApp();
      debugPrint("onMessageOpenedApp");
      debugPrint(event.data["test"]);
      if(event.data.containsKey("screen")){
        debugPrint(event.data["screen"]);
        if(event.data["screen"]=="test"){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>TestScreen(message: event.notification?.title,)));
        }
      }
    });
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }
  void showLocalNotification(RemoteMessage remoteMessage)async{
    await flutterLocalNotificationsPlugin.show(
        0, remoteMessage.notification?.title, remoteMessage.notification?.body,
        const NotificationDetails(
            android: AndroidNotificationDetails(
              "your channel id",
              "your channel name",
              channelDescription: "your channel description",
              importance: Importance.max,
              priority: Priority.high,
            )
        ));
  }
}

Future<void> onBackgroundMessage(RemoteMessage remoteMessage) async {
  debugPrint("onBackgroundMessage");
  debugPrint(remoteMessage.notification?.title);
}
