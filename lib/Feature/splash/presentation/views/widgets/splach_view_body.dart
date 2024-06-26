import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/local/cache_Enc_helper.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/login/presentation/views/login_view.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/splach_image_logo_white.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/tqnia_logo_white.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody> {
  bool isloading = false;
  @override
  Future fadeInAnimation() async {
     ;

    setState(() {
      isloading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    String x = CacheHelper.getData(key: 'Token') ?? '';
    
    // String x2 = await CacheEncryptHelper.readData(key: 'TokenEncrypted');
    print(x);
    // print('x2 is $x2');
    if (x != '') {
      TOKEN = x;
      Nav(context, const HomeView(currentidex: 0));
    } else {
      
      Nav(context, const LoginView());
    }
  }

  @override
  void initState() {
    super.initState();
    fadeInAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ((MediaQuery.of(context).size.height) / 2) - 100,
          ),
          const SplachViewImageWhite(),
          const SizedBox(
            height: 20,
          ),
          if (isloading)
            const CircularProgressIndicator(
              strokeWidth: 4.2,
            ),
          const Spacer(),
          const TqniaLogoWight(),
        ],
      ),
    );
  }
}
