import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_screen_serves.dart';
import 'package:shawativender/generated/l10n.dart';

class ProductItemInfo extends StatelessWidget {
  const ProductItemInfo(
      {super.key,
      required this.model,
      //  required this.contact,
      this.isEdit});
  final Service model;
  // final ContactDetails contact;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalizationCubit.get(context).isArabic()
                ? model.nameAr ?? ''
                : model.name ?? '',
            maxLines: 1,
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
                LocalizationCubit.get(context).isArabic()
                    ? model.placeAr ?? ''
                    : model.place ?? '',
                style: StylesData.font12.copyWith(color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // ClockInOutWithTime(
          //   clockin: model.days!.split('"')[1],
          //   clockout: model.days!.split('"')[2],
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // OwnerProduct(
          //   owner: contact,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              Text(
                "${S.of(context).Total}: ",
                style: StylesData.font14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: Text(
                  LocalizationCubit.get(context).isArabic()
                      ? "${model.priceWithCommission} ${S.of(context).SAR}  "
                      : "${S.of(context).SAR} ${model.priceWithCommission} ",
                  style:
                      StylesData.font18.copyWith(color: ConstColor.kMainColor),
                ),
              ),
              if (isEdit != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        NavegatorPush(
                            context,
                            BookingScreenServes(
                              model: model,
                            ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10,
                            left: LocalizationCubit.get(context).isArabic()
                                ? 0
                                : 10,
                            bottom: 10),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            size: 22, color: ConstColor.kMainColor),
                      ),
                    ),
                    Text(
                      model.createdAt.toString() ?? '',
                      style: StylesData.font12,
                    )
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
