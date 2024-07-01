import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shawativender/Core/blocobserve.dart';
import 'package:shawativender/Core/local/cache_Enc_helper.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:shawativender/Core/remote/dio_helper.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/size_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Terms%20And%20Privacy%20cubit/terms_and_privacy_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_state.dart';
import 'package:shawativender/Feature/splash/presentation/views/splach_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:shawativender/notification/push_notification.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyB6F4mUGbM_G_K_vRAaQFrlxu-bNMeVDpA',
              appId: '1:871788735000:android:ed3d99683ec2bc20bc316d',
              messagingSenderId: '871788735000',
              projectId: 'test-ff38a'),
        )
      : await Firebase.initializeApp();
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    sound: true,
    badge: true,
    carPlay: true,
    announcement: true,
    criticalAlert: true,
    provisional: true,
  );
  FirebaseMessaging.instance
      .requestPermission()
      .then((NotificationSettings settings) {
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined permission');
    }
  });
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // await LocalNotificationService.init();

// Listen for incoming FCM messages
  firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  firebaseMessaging.getToken().then((token) {
    print("FCM Token: $token");
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("FCM Message received: ${message.notification!.title}");

    // Access the notification channel ID
    String channelId = message.notification!.android?.channelId ?? '';
    print("Notification Channel ID: $channelId");

    // Handle the notification
    // ...
  });

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  //  await CacheEncryptHelper.init();
  // LocalNotificationService.init();

  FirebaseMessaging.onMessage.listen((event) {
    print("On Message From Bac Man ");
    Fluttertoast.showToast(
        msg: 'On Message From Bac Ma',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0);
    NotificationSound.onMessage(event);
    print('onMessage');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    NotificationSound.onMessageOpenedApp(event);
    print('onMessageOpenedApp');
  });
  FirebaseMessaging.onBackgroundMessage(
      NotificationSound.firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken();
  print("Token is // $token");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isarbic = CacheHelper.getData(key: 'isarbic') ?? false;
    // Connectivity().onConnectivityChanged.listen((event) {
    //   if (event == ConnectivityResult.none) {
    //     showToast(msq: 'No internet connection');
    //     // No internet
    //   } else {
    //     showToast(msq: 'internet connection');

    //     // Connected to internet
    //   }
    // });

    @override
    initState() {
      // TODO: implement initState
      super.initState();
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchCubit(HomeRepoImpl()),
          ),
          BlocProvider(
            create: (context) {
              return LocalizationCubit(HomeRepoImpl())
                ..l = isarbic ? const Locale('ar') : const Locale('en');
            },
          ),
          BlocProvider(
            create: (context) =>
                TermsAndPrivacyCubit(HomeRepoImpl())..getTermsAndPrivacy(),
          ),
          BlocProvider(
            create: (context) =>
                NotificationCubit(HomeRepoImpl())..getNotification(),
          ),
        ],
        child: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return BlocConsumer<LocalizationCubit, LocalizationState>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocConsumer<TermsAndPrivacyCubit, TermsAndPrivacyState>(
                  builder: (context, state) {
                    return GetMaterialApp(
                      locale: LocalizationCubit.get(context).l,
                      navigatorKey: navigatorKey,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      title: 'shawati Vender',
                      debugShowCheckedModeBanner: false,
                      
                      theme: ThemeData(
                  
                        
                        
                        
                          bottomSheetTheme: const BottomSheetThemeData(
                            
                              backgroundColor: Colors.white,
                              shadowColor: Colors.white,
                              surfaceTintColor: Colors.white),
                          scaffoldBackgroundColor: const Color(0xffF5F5F5),
                          useMaterial3: true,
                          appBarTheme: const AppBarTheme(
                            backgroundColor: Color(0xffF5F5F5),
                            surfaceTintColor: Colors.white,
                          ),
                          fontFamily: 'Poppins',
                          colorScheme: ColorScheme.fromSeed(
                                  seedColor: ConstColor.kMainColor,
                                  surface: Colors.white)
                              .copyWith(background: Colors.white)),
                      home: const SplachView(),
                    );
                  },
                  listener:
                      (BuildContext context, TermsAndPrivacyState state) {},
                );
              },
            );
          },
        ));
  }
}
