import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/owner_product.dart';

class ServiceProductItemInfo extends StatelessWidget {
  const ServiceProductItemInfo({super.key});

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
          const ClockInOutWithTime(
            clockin: '',
            clockout: '',
          ),
          const SizedBox(
            height: 10,
          ),
          OwnerProduct(
            owner: ContactDetails(ownerName: 'Hamada', phone: '010203040'),
          ),
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
              Expanded(
                child: Text(
                  "SAR 150 ",
                  style:
                      StylesData.font18.copyWith(color: ConstColor.kMainColor),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ConstColor.kSecondColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    'Edit service',
                    style:
                        StylesData.font8.copyWith(color: ConstColor.kMainColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
