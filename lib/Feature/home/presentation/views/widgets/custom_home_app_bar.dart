import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';

import 'package:shawativender/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
// import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 89,
          child: SplachViewImage(),
        ),
        const SizedBox(
          width: 10,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            NavegatorPush(context, const NotificationScreen());
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(AssetsData.notification),
                height: 15,
                width: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.testimage),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              )),
        ),
      ],
    );
  }
}
