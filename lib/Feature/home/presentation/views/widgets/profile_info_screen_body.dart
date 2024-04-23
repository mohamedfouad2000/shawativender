import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/edit_image_widget.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/edit_user_form.dart';

class ProfileInfoScreenBody extends StatefulWidget {
  const ProfileInfoScreenBody({super.key});

  @override
  State<ProfileInfoScreenBody> createState() => _ProfileInfoScreenBodyState();
}

class _ProfileInfoScreenBodyState extends State<ProfileInfoScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile info",
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 15,
            ),
            const EditImageWidget(),
            const SizedBox(
              height: 15,
            ),
            const EditUserForm()
          ],
        ),
      ),
    );
  }
}
