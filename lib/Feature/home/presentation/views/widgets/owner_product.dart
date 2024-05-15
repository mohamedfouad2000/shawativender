import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawativender/generated/l10n.dart';

class OwnerProduct extends StatelessWidget {
  const OwnerProduct({
    super.key,
    required this.owner,
  });
  final ContactDetails owner;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.testimage),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner.ownerName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
                Text(
                  S.of(context).Owner,
                  style: StylesData.font10.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              textNumber(number: owner.phone ?? '');
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(.4), width: .7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  )),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(AssetsData.chat),
                  color: Colors.grey,
                  size: 8,
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // InkWell(
          //   onTap: () {
          //     openDialPad(owner.phone ?? '');
          //   },
          //   child: Container(
          //     height: 40,
          //     width: 40,
          //     decoration: BoxDecoration(
          //         color: ConstColor.kMainColor,
          //         border:
          //             Border.all(color: Colors.grey.withOpacity(.4), width: .7),
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(8),
          //         )),
          //     child: const Padding(
          //       padding: EdgeInsets.all(10.0),
          //       child: ImageIcon(
          //         AssetImage(AssetsData.calling),
          //         color: Colors.white,
          //         size: 8,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
