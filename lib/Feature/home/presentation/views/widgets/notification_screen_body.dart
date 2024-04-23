import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/notification_item.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/notification_title.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationTitle(),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Dec, 2023 19",
            style: StylesData.font12,
          ),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
        ],
      ),
    );
  }
}
