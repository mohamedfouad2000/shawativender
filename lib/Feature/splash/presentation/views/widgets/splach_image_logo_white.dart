import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';

class SplachViewImageWhite extends StatelessWidget {
  const SplachViewImageWhite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage(AssetsData.splachback),
        width: 170,
      ),
    );
  }
}
