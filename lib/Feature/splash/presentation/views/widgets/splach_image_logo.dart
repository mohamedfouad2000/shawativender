import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';

class SplachViewImage extends StatelessWidget {
  const SplachViewImage({
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
