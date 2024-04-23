import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/components.dart';
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
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isloading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    Nav(context, const LoginView());
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
