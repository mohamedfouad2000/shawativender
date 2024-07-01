import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_screen_serves.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/requests_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_info.dart';
import 'package:shawativender/generated/l10n.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.model,
    // required this.contact,
    this.isEdit,
    this.fromhome,
    this.contactDetails,
    this.bookingStatus,
    required this.start,
    required this.end,
    this.paymentStatusId,
    required this.distance,
  });
  final Service model;
  final ContactDetails? contactDetails;
  final bool? fromhome;
  final int? paymentStatusId;
  final String start;
  final String end;
  final String distance;

  // final ContactDetails contact;
  final bool? isEdit;
  final int? bookingStatus;

  @override
  Widget build(BuildContext context) {
    Map<int, String> status = {
      1: S.of(context).pending,
      // 2: '',
      3: S.of(context).Approved,
      4: S.of(context).Reject,
      5: S.of(context).Canceled,
    };
    List<String> categoriesList = [
      S.of(context).colse,
      S.of(context).open,
      S.of(context).pending,
    ];
    // print('Booking Is  ${model.bookingCount}');
    return InkWell(
      onTap: () {
        if (fromhome == null) {
          navigateWithAnimation(
              context,
              BookingScreenServes(
                model: model,
                start: start,
                end: end,
              ));
        } else {
          navigateWithAnimation(
              context,
              RequestsScreen(
                serviceId: model.id!,
                // reqId: model.id!,
              ));
        }
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          // color: Colors.black,
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: Theme.of(context).primaryColor.withOpacity(.125))
          ],
        ),

        // decoration: BoxDecoration(
        //   color: Colors.white.withOpacity(.9),
        //   borderRadius: BorderRadius.circular(20),
        //   boxShadow: const [],
        // ),
        duration: const Duration(seconds: 2),
        curve: Curves.bounceInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: LocalizationCubit.get(context).isArabic()
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // image: const DecorationImage(
                    //     image: AssetImage(AssetsData.testimage2),
                    //     fit: BoxFit.cover)
                  ),
                  child: CachedImage('$xURLIMAGE${model.image}'),
                ),
                Positioned(
                  right: LocalizationCubit.get(context).isArabic() ? null : 18,
                  left: LocalizationCubit.get(context).isArabic() ? 18 : null,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 34,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ConstColor.kMainColor,
                        child: Center(
                            child: FittedBox(
                          child: Text(
                            fromhome == null
                                ? categoriesList[model.accept ?? 0]
                                : '${status[bookingStatus]}',
                            style:
                                StylesData.font14.copyWith(color: Colors.white),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ProductItemInfo(
              distance: distance,
              fromhome: fromhome,
              paymentStatusId: paymentStatusId,
              contactDetails: contactDetails,
              model: model,
              // contact: contact,
              isEdit: isEdit, start: start, end: end,
            ),
          ],
        ),
      ),
    );
  }
}
