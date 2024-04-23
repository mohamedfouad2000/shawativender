import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/styles.dart';

class OwnerProduct extends StatelessWidget {
  const OwnerProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
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
                  "Sorted by",
                  style: StylesData.font10.copyWith(color: Colors.grey),
                ),
                Text(
                  "Mohamed Mahmoud",
                  style: StylesData.font13.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}
