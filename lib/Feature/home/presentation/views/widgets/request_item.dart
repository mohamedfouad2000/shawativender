import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';

import 'package:shawativender/Core/utils/components.dart';

import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/rental.dart';

import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/user_widget.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({
    super.key,
    required this.text,
    required this.name,
    required this.date,
    required this.image,
    required this.proImage,
    required this.model,
    required this.textAr,
  });
  final String text;
  final String name;
  final String textAr;

  final String date;
  final String image;
  final String proImage;
  final Rental model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavegatorPush(
            context,
            BookingDetailsScreen(
              model: model,
              // fromData: true,
            ));
      },
      child: Row(
        children: [
          Image(
            image: NetworkImage('$xURLIMAGE$proImage'),
            height: 70,
            width: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalizationCubit.get(context).isArabic() ? textAr : text,
                  style: StylesData.font12,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                UserWidget(name: name, date: date, image: image),
              ],
            ),
          )
        ],
      ),
    );
  }
}
