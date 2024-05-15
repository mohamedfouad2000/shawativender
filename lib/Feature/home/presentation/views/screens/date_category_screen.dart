import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/data_category_screen_body.dart';

class DataCategoryScreen extends StatelessWidget {
  const DataCategoryScreen({super.key, required this.cateId});

  final int cateId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: DataCategoryScreenBody(cateId: cateId),
    );
  }
}
