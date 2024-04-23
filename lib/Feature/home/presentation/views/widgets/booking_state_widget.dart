import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';

class BookingStatusWidget extends StatelessWidget {
  const BookingStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "#71 Booking Status Has Been..",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StylesData.font12
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ConstColor.kMainColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              "4",
              style: StylesData.font12Montserrat,
            ),
          ),
        )
      ],
    );
  }
}
