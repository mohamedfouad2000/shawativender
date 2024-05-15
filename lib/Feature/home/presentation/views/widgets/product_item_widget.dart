import 'package:flutter/material.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_info.dart';
import 'package:shawativender/generated/l10n.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.model,
    // required this.contact,
    this.isEdit,
  });
  final Service model;
  // final ContactDetails contact;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    // print('Booking Is  ${model.bookingCount}');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [],
      ),
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
                      radius: 26,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: ConstColor.kMainColor,
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          isEdit != null
                              ? model.bookingCount.toString()
                              : (model.accept == 1
                                  ? S.of(context).open
                                  : S.of(context).colse),
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
            model: model,
            // contact: contact,
            isEdit: isEdit,
          ),
        ],
      ),
    );
  }
}
