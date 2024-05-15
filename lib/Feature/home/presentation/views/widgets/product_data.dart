import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/generated/l10n.dart';

class ProductData extends StatelessWidget {
  const ProductData({
    super.key,
    required this.title,
    required this.titlearab,
    required this.subTitle,
    required this.subTitlearab,
    required this.image,
    required this.money,
    required this.method,
  });
  final String title;
  final String subTitle;
  final String image;
  final String money;
  final String titlearab;
  final String subTitlearab;
  final String method;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CachedImage('$xURLIMAGE$image'),
              ),
              Positioned(
                right: 18,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ConstColor.kMainColor,
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          method == '1'
                              ? S.of(context).unpaid
                              : method == '2'
                                  ? S.of(context).pending
                                  : S.of(context).paid,
                          style:
                              StylesData.font14.copyWith(color: Colors.white),
                        ),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                LocalizationCubit.get(context).isArabic() ? titlearab : title,
                style: StylesData.font24Google,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
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
                    ? subTitlearab
                    : subTitle,
                style: StylesData.font12.copyWith(color: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                LocalizationCubit.get(context).isArabic()
                    ? " $money ${S.of(context).SAR}  "
                    : "${S.of(context).SAR} $money ",
                style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
              ),
              Text(
                S.of(context).day,
                style: StylesData.font16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
