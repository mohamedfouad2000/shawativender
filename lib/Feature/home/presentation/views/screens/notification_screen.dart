import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/notification_screen_body.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<NotificationCubit>(context).getNotificationsCount();
        Navigator.of(context).pop();

        return true;
      },
      child: Scaffold(
        appBar: customAppBarInNotification(context, ontap: () {
          BlocProvider.of<NotificationCubit>(context).getNotificationsCount();
          Navigator.pop(context);
        }),
        body: const NotificationScreenBody(),
      ),
    );
  }
}
