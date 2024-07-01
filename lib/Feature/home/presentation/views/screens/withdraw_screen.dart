import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/withdraw_screen_body.dart';

class WIthDrawScreen extends StatelessWidget {
  const WIthDrawScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const WIthDrawScreenBody(),
    );
  }
}
