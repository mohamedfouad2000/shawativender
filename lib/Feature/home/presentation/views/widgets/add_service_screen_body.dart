import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/add_service_form.dart';

class AddServiceScreenBody extends StatelessWidget {
  const AddServiceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add service",
              style: StylesData.font24Google,
            ),
            Text("add your service now!", style: StylesData.font12),
            const SizedBox(
              height: 20,
            ),
            const AddServiceForm()
          ],
        ),
      ),
    );
  }
}
