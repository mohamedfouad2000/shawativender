import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/colors.dart';

import 'package:shawativender/Core/utils/components.dart';

import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/datum.dart';

import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/user_widget.dart';
import 'package:shawativender/generated/l10n.dart';

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
    required this.payment,
    required this.paymentStatusId,
  });
  final String text;
  final String name;
  final String textAr;
  final int payment;
  final String date;
  final String image;
  final String proImage;
  final DatumRequests model;
  final int paymentStatusId;

  @override
  Widget build(BuildContext context) {
    Map<int, String> paymentStatus = {
      1: S.of(context).unpaid,
      2: S.of(context).pending,
      3: S.of(context).paid,
    };
    return InkWell(
      onTap: () {
        NavegatorPush(
            context,
            BookingDetailsScreen(
              model: model,
              paymentStatusId: paymentStatusId,

              // fromData: true,
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: LocalizationCubit.get(context).isArabic()
                ? Alignment.topRight
                : Alignment.topLeft,
            children: [
              Image(
                image: NetworkImage('$xURLIMAGE$proImage'),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: ConstColor.kMainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  paymentStatus[payment] ?? "",
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
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
