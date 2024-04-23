import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/spacer.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_person.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_state_widget.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BookingStatusWidget(),
          const SizedBox(
            height: 10,
          ),
          const SpacerWidget(),
          const SizedBox(
            height: 10,
          ),
          const BookingPerson(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Awesome apartment",
            style: StylesData.font11.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
