import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/styles.dart';

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "Notifications",
          style: StylesData.font18,
        )),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Delete all ",
                style: StylesData.font12.copyWith(color: Colors.red),
              ),
              const ImageIcon(
                AssetImage(AssetsData.delete),
                color: Colors.red,
              )
            ],
          ),
        )
      ],
    );
  }
}
