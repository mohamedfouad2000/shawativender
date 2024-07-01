import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
// import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
// import 'package:shawativender/main.dart';
import 'package:shawativender/notification/local_notifications/notifications_serves.dart';

class NotificationSound {
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage? message) async {
    FlutterAppBadger.updateBadgeCount(0);
    print("aha");
    print("${message?.notification?.body}");
    print("${message?.messageId}");
    print(message?.notification?.title ?? '');

    print("backGround11");
    print(message?.data['model_id'].toString());

    print(message?.notification?.body);
    try {
      Fluttertoast.showToast(
          msg: message?.notification?.body.toString() ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18.0);
      // BlocProvider.of<NotificationCubit>(navigator?.context ?? Get.context!)
      //     .getNotificationsCount()
      //     .then((value) {
      //   print("object us on");
      // });
    } catch (e) {
      print(e);
    }
    return Future<void>.value().then((value) async {
      // await LocalNotificationService.flutterLocalNotificationsPlugin
      //     .cancelAll();
      await LocalNotificationService.init(event: message!);
      LocalNotificationService.showBasicNotification(
        body: message.notification?.body ?? '',
        title: message.notification?.title ?? '',
        id: 1,
      );
    });

    // 1 serves
    //2 requests
  }

  static Future<void> onMessageOpenedApp(RemoteMessage event) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.cancelAll();
    // flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.setNotificationBadge(badgeCount);

    FlutterAppBadger.updateBadgeCount(0);
    print("on message open");
    print(event.data.toString());
    print(event.notification?.body);
    print('on onMessage${event.data.toString()}');
    await BlocProvider.of<NotificationCubit>(Get.context!)
        .getNotificationsCount();
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

    // RequestsScreen
    //Homeview(id=2)
  }

  static Future<void> onMessage(RemoteMessage event) async {
    print("on onMessage");
    // print('on onMessage ${event.notification?.body}');
    // print('on onMessage${event.notification?.title}');
    print('on onMessage${event.data.toString()}');
    await BlocProvider.of<NotificationCubit>(Get.context!)
        .getNotificationsCount();

    print(event.notification?.titleLocArgs);
    print(event.notification);
    LocalNotificationService.init(event: event);
    LocalNotificationService.showBasicNotification(
      body: event.notification?.body ?? '',
      title: event.notification?.title ?? '',
      id: 1,
    );

    //  NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
    // notificationManager.cancelAll();

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
