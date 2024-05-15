import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/generated/l10n.dart';

class ClockInOutWithTime extends StatelessWidget {
  const ClockInOutWithTime({
    super.key,
    required this.clockin,
    required this.clockout,
  });
  final String clockin;
  final String clockout;

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
                  Text(
                    S.of(context).ClockIn,
                    style: StylesData.font9.copyWith(
                        color: const Color(0xffABABAB),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                clockin.isNotEmpty && clockin != ''
                    ? clockin
                        .replaceAll('[', '')
                        .replaceAll(']', '')
                        .replaceAll('"', "")
                        .replaceAll('\\', '')
                    : '',
                style: StylesData.font11.copyWith(color: Colors.black),
              )
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
                Text(
                  S.of(context).ClockOut,
                  style: StylesData.font9.copyWith(
                      color: const Color(0xffABABAB),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              clockout.isNotEmpty && clockout != ''
                  ? clockout
                      .replaceAll('[', '')
                      .replaceAll(']', '')
                      .replaceAll('"', "")
                      .replaceAll('\\', '')
                      .substring(0, 16)
                  : '',
              style: StylesData.font11.copyWith(color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}
