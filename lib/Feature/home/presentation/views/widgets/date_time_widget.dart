import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/generated/l10n.dart';

class DataTimeWidget extends StatelessWidget {
  const DataTimeWidget({super.key, required this.time, required this.day});
  final String time;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageIcon(
                    const AssetImage(
                      AssetsData.note,
                    ),
                    color: ConstColor.kMainColor,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    S.of(context).requestDay,
                    style: StylesData.font9.copyWith(
                        color: const Color(0xffABABAB),
                        fontWeight: FontWeight.w400),
                  ).animate().fade().slide(),
                ],
              )
                  .animate()
                  .addEffect(const AlignEffect(curve: Curves.bounceIn))
                  .scale(curve: Curves.easeInOutQuad),
              const SizedBox(
                height: 4,
              ),
              Text(
                day,
                textAlign: TextAlign.start,
                style: StylesData.font11.copyWith(color: Colors.black),
              ).animate(
                onPlay: (controller) {
                  // controller.forward().then((value) => controller.reverse());
                },
              )
                  // .addEffect(const AlignEffect(curve: Curves.easeInOutQuad))
                  .scale(curve: Curves.easeInOutQuad),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsData.clock,
                  ),
                  color: ConstColor.kMainColor,
                  size: 15,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  S.of(context).requestTime,
                  style: StylesData.font9.copyWith(
                      color: const Color(0xffABABAB),
                      fontWeight: FontWeight.w400),
                )
                    .animate()
                    .addEffect(const AlignEffect(curve: Curves.bounceIn))
                    .scale(curve: Curves.easeInOutQuad),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              time,
              style: StylesData.font11.copyWith(color: Colors.black),
            )
                .animate()
                .addEffect(const AlignEffect(curve: Curves.bounceIn))
                .scale(curve: Curves.easeInOutQuad),
          ],
        )
      ],
    );
  }
}
