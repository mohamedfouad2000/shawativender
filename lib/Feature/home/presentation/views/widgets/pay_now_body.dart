import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';

class PayNowBody extends StatelessWidget {
  const PayNowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              AssetsData.confirmImage,
            ),
            height: 120,
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Service added successfully",
              style: StylesData.font24Google,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          defaultButton(
              fun: () {
                NavegatorPush(context, const HomeView(currentidex: 2));
                // NavegatorPush(context, const ScheduleScreen());
              },
              textWidget: Text(
                'Add new service',
                style: StylesData.font13,
              ),
              height: 54,
              c: ConstColor.kMainColor),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Nav(
                  context,
                  const HomeView(
                    currentidex: 0,
                  ));
            },
            child: Text(
              "back Home",
              style: StylesData.font14,
            ),
          ),
        ],
      ),
    );
  }
}
