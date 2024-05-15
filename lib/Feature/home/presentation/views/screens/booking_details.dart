import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/rental.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_screen_body.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_details_servec.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
    required this.model,
  });
  final Rental model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
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
      body: BookingDetailsScreenBody(
        model: model,
      ),
    );
  }
}
