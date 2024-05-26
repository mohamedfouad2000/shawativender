import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/support_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/terms_screen.dart';
import 'package:shawativender/Feature/lang/presentation/views/lang_page_view.dart';
import 'package:shawativender/Feature/login/presentation/views/login_view.dart';
import 'package:shawativender/generated/l10n.dart';

class ListTitleMenu extends StatefulWidget {
  const ListTitleMenu({super.key});

  @override
  State<ListTitleMenu> createState() => _ListTitleMenuState();
}

class _ListTitleMenuState extends State<ListTitleMenu> {
  List<String> images = [
    AssetsData.note,
    AssetsData.like,
    AssetsData.notification,
    AssetsData.language,
    AssetsData.support,
    AssetsData.terms,
    AssetsData.logout,
  ];
  List<Widget> widgets = [
    const HomeView(
      currentidex: 2,
    ),
    const HomeView(
      currentidex: 1,
    ),
    const NotificationScreen(),
    const LangPageView(
      fromLogin: false,
    ),
    const SupportScreen(),
    const TermsScreen(),
    const LoginView(),
  ];
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      S.of(context).MyServecs,
      S.of(context).Reviews,
      S.of(context).Notifications,
      S.of(context).Language,
      S.of(context).support,
      S.of(context).termsconditions,
      S.of(context).logout,
    ];
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return menuItem(
            title: titles[index],
            image: images[index],
            context: context,
            widget: widgets[index],
            index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 7,
    );
  }

  Widget menuItem(
          {required String title,
          required String image,
          required context,
          required Widget widget,
          required int index}) =>
      InkWell(
        onTap: () {
          if (index == 0 || index == 6) {
            if (index == 6) {
              CacheHelper.removeData(key: 'Token');
              TOKEN = '';
            }
            Nav(context, widget);
          } else {
            NavegatorPush(context, widget);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  //
                  color: index == 6
                      ? const Color(0xffF2E1E1)
                      : const Color(0xffEEF3FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Image(
                  image: AssetImage(image),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  style: StylesData.font12.copyWith(
                    color: index == 6 ? const Color(0xffFC2323) : Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (index == 0 || index == 6) {
                      if (index == 6) {
                        CacheHelper.removeData(key: 'Token');
                        TOKEN = '';
                      }
                      Nav(context, widget);
                    } else {
                      NavegatorPush(context, widget);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: Colors.grey.shade300,
                  ))
            ],
          ),
        ),
      );
}
