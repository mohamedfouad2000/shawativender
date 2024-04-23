import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/owner_product.dart';

class ProductItemInfo extends StatelessWidget {
  const ProductItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fransico Apartment",
            style: StylesData.font24Google,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 15,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Jeddah, Saudi Arabia",
                style: StylesData.font12.copyWith(color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ClockInOutWithTime(),
          const SizedBox(
            height: 10,
          ),
          const OwnerProduct(),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Total: ",
                style: StylesData.font14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              Text(
                "SAR 150 ",
                style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
