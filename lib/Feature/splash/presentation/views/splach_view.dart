import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/splach_view_body.dart';

class SplachView extends StatelessWidget {
  const SplachView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.kbackColor,
      resizeToAvoidBottomInset: false,
      
      body: const SplachViewBody(),
    );
  }
}
