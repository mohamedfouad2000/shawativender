import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_screen_body.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_servec.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingScreenServes extends StatelessWidget {
  const BookingScreenServes(
      {super.key,
      required this.model,
      this.fromData,
      required this.start,
      required this.end});
  final Service model;
  final bool? fromData;
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        widget: fromData != null
            ? const SizedBox()
            : TextButton(
                onPressed: () {
                  NavegatorPush(
                      context,
                      RequestsScreen(
                        serviceId: model.id!,
                        // reqId: model.id!,
                      ));
                },
                child: Text(
                  S.current.ShowRequests,
                  style:
                      StylesData.font15.copyWith(color: ConstColor.kMainColor),
                )),
        // title: Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(18),
        //       border: Border.all(color: ConstColor.kMainColor)),
        //   child: Text(
        //     "1 D : 36 h : 24 m ",
        //     style: StylesData.font20.copyWith(fontSize: 18),
        //   ),
        // )
      ),
      body: BookingDetailsServes(
        model: model,
        endTime: end,
        startTime: start,
      ),
    );
  }
}
