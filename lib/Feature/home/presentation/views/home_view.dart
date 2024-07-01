import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Notification/notification_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/main_home_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/menu_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/review_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/services_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/withdraw_screen.dart';
import 'package:shawativender/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.currentidex});
  final int currentidex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    setState(() {
      currentind = widget.currentidex;
    });
     BlocProvider.of<NotificationCubit>(context).getNotificationsCount();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // App is in foreground
      print('App resumed from background');
      // Call your function or perform your tasks here
      myFunction();
    }
  }

  void myFunction() {
    // Implement your logic here
    print('Executing function on app resume');
    print("Aha Ya Man Ya Asta");
    BlocProvider.of<NotificationCubit>(context).getNotificationsCount();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.cancelAll();
    // FlutterAppBadger.updateBadgeCount(12);

    // Example: Refresh data, show notifications, etc.
  }

  int currentind = 0;
  @override
  List<Widget> screens = [
    const MainHomeScreen(),
    const ReviewScreen(),
    const ServicesScreen(),
    const MenuScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(HomeRepoImpl())..getProfileData(),
        ),
      ],
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(child: screens[currentind]),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? TextStyle(color: ConstColor.kMainColor)
                          : const TextStyle(color: Colors.black),
                ),
              ),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: Theme.of(context).primaryColor.withOpacity(.125))
                  ],
                ),
                child: NavigationBar(
                  animationDuration: const Duration(seconds: 1),
                  indicatorColor: Colors.transparent,
                  onDestinationSelected: (value) {
                    print(value);
                    setState(() {
                      if (value == 2) {
                        SearchCubit.get(context).setallempty();
                      }
                      currentind = value;
                    });
                  },
                  backgroundColor: Colors.white,
                  destinations: [
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.homeicon),
                          size: 27,
                          color: currentind == 0
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Home),
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.like),
                          size: 27,
                          color: currentind == 1
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Reviews),
                    NavigationDestination(
                      icon: ImageIcon(
                        const AssetImage(AssetsData.note),
                        size: 27,
                        color: currentind == 2
                            ? ConstColor.kMainColor
                            : const Color(0xFF6E7177),
                      ),
                      label: S.of(context).Servecs,
                    ),
                    NavigationDestination(
                        icon: ImageIcon(
                          const AssetImage(AssetsData.menuicon),
                          size: 27,
                          color: currentind == 3
                              ? ConstColor.kMainColor
                              : const Color(0xFF6E7177),
                        ),
                        label: S.of(context).Menu),
                  ],
                  selectedIndex: currentind,
                  elevation: 0.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
