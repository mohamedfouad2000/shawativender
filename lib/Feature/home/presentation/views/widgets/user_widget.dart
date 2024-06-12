import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/styles.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.name,
    required this.date,
    required this.image,
  });
  final String name;
  final String date;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage('$xURLIMAGE$image'),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          name,
          style: StylesData.font12.copyWith(color: Colors.black),
          maxLines: 1,
        )),
        const SizedBox(
          width: 10,
        ),
        Text(
          date
              .replaceAll('[', '')
              .replaceAll(']', "")
              .replaceAll('"', '')
              .replaceAll("\\", '')
              .trim()
              .substring(0, 10),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StylesData.font12,
        )
      ],
    );
  }
}
