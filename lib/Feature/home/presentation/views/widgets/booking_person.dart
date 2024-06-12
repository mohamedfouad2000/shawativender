import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';

class BookingPerson extends StatelessWidget {
  const BookingPerson({
    super.key,
    required this.rate,
    required this.username,
    required this.image,
    required this.msq,
  });
  final double rate;
  final String username;
  final String image;
  final String msq;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
              // image: const DecorationImage(
              //     image: AssetImage(
              //       AssetsData.testimage2,
              //     ),
              //     fit: BoxFit.cover),
              // borderRadius: BorderRadius.circular(14),
              ),
          child: CachedImage('$xURLIMAGE$image'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StylesData.font12
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ).animate().scale(curve: Curves.easeInOutQuad),
              Text(
                msq,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: StylesData.font10
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
              ).animate().scale(curve: Curves.easeInOutQuad),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ConstColor.kMainColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.grey.shade300),
          ),
          duration: const Duration(seconds: 2),
          curve: Easing.legacy,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$rate ",
                style: StylesData.font12Montserrat,
              ).animate().scale(curve: Curves.easeInOutQuad),
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 15,
              ).animate().scale(curve: Curves.easeInOutQuad),
            ],
          ),
        ),
      ],
    );
  }
}
