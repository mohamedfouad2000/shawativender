import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/main_home_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/menu_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/review_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/services_screen.dart';
import 'package:shawativender/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.currentidex});
  final int currentidex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentind = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      currentind = widget.currentidex;
    });
  }

  List<Widget> screens = [
    const MainHomeScreen(),
    const ReviewScreen(),
    const ServicesScreen(),
    const MenuScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(HomeRepoImpl())..getProfileData(),
      child: Scaffold(
        body: screens[currentind],
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
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50))),
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
      ),
    );
  }
}
