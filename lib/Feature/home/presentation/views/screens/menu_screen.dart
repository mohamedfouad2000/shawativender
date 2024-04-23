import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/list_title_menu.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/peson_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 15,
            ),
            const PersonWidget(),
            const SizedBox(
              height: 15,
            ),
            const ListTitleMenu()
          ],
        ),
      ),
    );
  }
}
