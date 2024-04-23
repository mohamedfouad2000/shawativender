import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/pay_now_body.dart';

class PayNowScreen extends StatelessWidget {
  const PayNowScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const PayNowBody(),
    );
  }
}
