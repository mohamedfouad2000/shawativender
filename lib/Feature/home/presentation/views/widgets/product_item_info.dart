import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_screen_serves.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/owner_product.dart';
import 'package:shawativender/generated/l10n.dart';

class ProductItemInfo extends StatelessWidget {
  const ProductItemInfo(
      {super.key,
      required this.model,
      //  required this.contact,
      this.isEdit,
      this.contactDetails,
      required this.start,
      required this.end,
      this.paymentStatusId,
      this.fromhome});
  final Service model;
  // final ContactDetails contact;
  final bool? isEdit;
  final int? paymentStatusId;
  final bool? fromhome;

  final ContactDetails? contactDetails;
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    Map<int, String> paymentStatus = {
      1: S.of(context).unpaid,
      2: S.of(context).pending,
      3: S.of(context).paid,
    };
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  LocalizationCubit.get(context).isArabic()
                      ? model.nameAr ?? ''
                      : model.name ?? '',
                  maxLines: 1,
                  style: StylesData.font24Google,
                )
                    .animate()
                    .scale(curve: Curves.easeInOutQuad)
                    .show(duration: 500.ms),
              ),
              if (fromhome != null)
                Text(
                  '${paymentStatus[paymentStatusId ?? 0]}',
                  style: StylesData.font16raleway
                      .copyWith(color: ConstColor.kMainColor),
                )
            ],
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
                  .animate()
                  .addEffect(const AlignEffect(curve: Curves.bounceIn))
                  .scale(curve: Curves.easeInOutQuad)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClockInOutWithTime(
            clockin: start != ''
                ? start
                : model.days
                        ?.split(',')
                        .first
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
            clockout: end != ''
                ? end
                : model.days
                        ?.split(',')
                        .last
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
          ),
          const SizedBox(
            height: 10,
          ),
          if (contactDetails != null && isEdit == null)
            OwnerProduct(
              owner: contactDetails!,
            ),
          if (contactDetails != null && isEdit == null)
            const SizedBox(
              height: 10,
            ),
          Row(
            children: [
              Text(
                "${S.of(context).Total}: ",
                style: StylesData.font14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              )
                  .animate()
                  .addEffect(const AlignEffect(curve: Curves.bounceIn))
                  .scale(curve: Curves.easeInOutQuad),
              Expanded(
                child: Text(
                  LocalizationCubit.get(context).isArabic()
                      ? "${model.regularPrice} ${S.of(context).SAR}  "
                      : "${S.of(context).SAR} ${model.regularPrice} ",
                  maxLines: 1,
                  style: StylesData.font18.copyWith(
                      color: ConstColor.kMainColor, fontFamily: 'Poppins'),
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
                              start: '',
                              end: '',
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
                      model.createdAt.toString().substring(0, 10) ?? '',
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
