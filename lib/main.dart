import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/blocobserve.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:shawativender/Core/remote/dio_helper.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/size_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_state.dart';
import 'package:shawativender/Feature/splash/presentation/views/splach_view.dart';

import 'package:shawativender/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isarbic = CacheHelper.getData(key: 'isarbic') ?? false;

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
            return LocalizationCubit()
              ..l = isarbic ? const Locale('ar') : const Locale('en');
          },
        ),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            locale: LocalizationCubit.get(context).l,
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
                scaffoldBackgroundColor: const Color(0xffF5F5F5),
                colorScheme:
                    ColorScheme.fromSeed(seedColor: ConstColor.kMainColor),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xffF5F5F5),
                  surfaceTintColor: Colors.white,
                ),
                fontFamily: 'Poppins'),
            home: const SplachView(),
          );
        },
      ),
    );
  }
}
