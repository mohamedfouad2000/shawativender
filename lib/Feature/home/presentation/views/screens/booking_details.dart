import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/datum.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_screen_body.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_servec.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
    required this.model,
    required this.paymentStatusId,
  });
  final DatumRequests model;
  final int paymentStatusId;

  @override
  Widget build(BuildContext context) {
    Map<int, String> paymentStatus = {
      1: S.of(context).unpaid,
      2: S.of(context).pending,
      3: S.of(context).paid,
    };
    return Scaffold(
      appBar: customAppBar(context,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: ConstColor.kMainColor)),
            child: Text(
              '${paymentStatus[paymentStatusId]}',
              style: StylesData.font20.copyWith(fontSize: 18),
            ),
          )),
      body: BookingDetailsScreenBody(
        model: model,
      ),
    );
  }
}
