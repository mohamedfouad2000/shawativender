import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/location/presentation/views/widgets/enable_location_body.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key, required this.fromLogin});
  final bool fromLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !fromLogin ? customAppBar(context) : AppBar(),
      resizeToAvoidBottomInset: false,
      body: const EnableLocationBody(),
    );
  }
}
