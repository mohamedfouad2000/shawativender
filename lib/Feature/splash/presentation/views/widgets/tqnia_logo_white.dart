import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';

class TqniaLogoWight extends StatelessWidget {
  const TqniaLogoWight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(AssetsData.tqniaLogowhite),
      width: 170,
    );
  }
}
