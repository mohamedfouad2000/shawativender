import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/location/presentation/views/widgets/enable_location_body.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const EnableLocationBody(),
    );
  }
}
