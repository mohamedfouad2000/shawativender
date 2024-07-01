import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  static Future init({required RemoteMessage event}) async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (i) {
        if (event.data['model_type'] == '2') {
          print("object  ");

          print(' object${event.data['model_id'].toString()}');
          int x = event.data['model_id'].toString() == ''
              ? 0
              : int.parse(event.data['model_id'].toString());
          print('x is $x');
          // NavegatorPush(Get.context!, RequestsScreen(serviceId: x));
          NavegatorPush(Get.context!, const NotificationScreen());
        } else {
          print(' object 2${event.data['model_id'].toString()}');
          NavegatorPush(Get.context!, const NotificationScreen());
          // NavegatorPush(Get.context!, const HomeView(currentidex: 2));
        }

        print(event.notification?.title);
      },
      onDidReceiveBackgroundNotificationResponse: (i) {
        if (event.data['model_type'] == '2') {
          print("object  ");

          print(' object${event.data['model_id'].toString()}');
          int x = event.data['model_id'].toString() == ''
              ? 0
              : int.parse(event.data['model_id'].toString());
          print('x is $x');
          NavegatorPush(Get.context!, const NotificationScreen());
          // NavegatorPush(Get.context!, RequestsScreen(serviceId: x));
        } else {
          print(' object 2${event.data['model_id'].toString()}');

          // NavegatorPush(Get.context!, const HomeView(currentidex: 2));
          NavegatorPush(Get.context!, const NotificationScreen());
        }

        print(event.notification?.title);
      },
    );
  }

  static Future init2({required Function ontap}) async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (i) {},
      onDidReceiveBackgroundNotificationResponse: (i) {},
    );
  }

  //basic Notification
  static void showBasicNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        'id1', 'basic notification',
        importance: Importance.max,
        priority: Priority.high,
        icon: "flutter_logo",
        channelShowBadge: true);
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: "Payload Data",
    );
  }
}

//1.setup. [Done]
//2.Basic Notification. [Done]
//3.Repeated Notification. [Done]
//4.Scheduled Notification. [Done]
//5.Custom Sound. [Done]
//6.on Tab. [Done]
//7.Daily Notifications at specific time. [Done]
//8.Real Example in To Do App.
