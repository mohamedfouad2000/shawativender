import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/edit_service_form.dart';
import 'package:shawativender/generated/l10n.dart';

class EditServiceScreen extends StatelessWidget {
  const EditServiceScreen({super.key, required this.model});
  final Service model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: Text(S.of(context).edit_service)),
      body: EditServiceForm(model: model),
    );
  }
}
