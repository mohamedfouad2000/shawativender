import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
// import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
// import 'package:shawativender/main.dart';
import 'package:shawativender/notification/local_notifications/notifications_serves.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NotificationSound {
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage? message) async {
    print("backGround");
    print(message?.notification?.body);
    // 1 serves
    //2 requests
  }

  static Future<void> onMessageOpenedApp(RemoteMessage event) async {
    print("on message open");
    print(event.data.toString());
    print(event.notification?.body);
    print('on onMessage${event.data.toString()}');
    if (event.data['model_type'] == '2') {
      print("object  ");

      print(' object${event.data['model_id'].toString()}');
      int x = event.data['model_id'].toString() == ''
          ? 0
          : int.parse(event.data['model_id'].toString());
      print('x is $x');
      NavegatorPush(Get.context!, RequestsScreen(serviceId: x));
    } else {
      print(' object 2${event.data['model_id'].toString()}');

      NavegatorPush(Get.context!, const HomeView(currentidex: 2));
    }

    print(event.notification?.title);

    // RequestsScreen
    //Homeview(id=2)
  }

  static Future<void> onMessage(RemoteMessage event) async {
    print("on onMessage");
    // print('on onMessage ${event.notification?.body}');
    // print('on onMessage${event.notification?.title}');
    print('on onMessage${event.data.toString()}');

    print(event.notification?.titleLocArgs);
    print(event.notification);
    LocalNotificationService.init(event: event);
    LocalNotificationService.showBasicNotification(
      body: event.notification?.body ?? '',
      title: event.notification?.title ?? '',
      id: 1,
    );

    // print(event.data.toString());
    // print(event.notification?.title);
    Fluttertoast.showToast(
        msg: event.notification!.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
