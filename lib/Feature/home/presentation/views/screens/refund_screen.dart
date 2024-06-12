import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/refund_screen_body.dart';

class RefundScreen extends StatelessWidget {
  const RefundScreen(
      {super.key, required this.refundText, required this.refundTextAr});
  final String refundText;
  final String refundTextAr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body:
          RefundScreenBody(refundText: refundText, refundTextAr: refundTextAr),
    );
  }
}
