import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';

class SplachViewImageBefore extends StatelessWidget {
  const SplachViewImageBefore({
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
