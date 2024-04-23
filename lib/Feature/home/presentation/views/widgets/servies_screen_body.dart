import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/add_service_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/search_widget.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/servies_product_item.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/type_filter.dart';

class ServicesScreenBody extends StatefulWidget {
  const ServicesScreenBody({super.key});

  @override
  State<ServicesScreenBody> createState() => _ServicesScreenBodyState();
}

class _ServicesScreenBodyState extends State<ServicesScreenBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            const SizedBox(
              height: 20,
            ),
            HomeSearchWidget(searchController: searchController),
            const SizedBox(
              height: 20,
            ),
            const TypeReview(),
            const SizedBox(
              height: 20,
            ),
            const ServiesProductItem(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const ServiesProductItem(),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
                fun: () {
                  NavegatorPush(context, const AddServiceScreen());
                },
                textWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: ConstColor.kMainColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Service',
                      style: StylesData.font13
                          .copyWith(color: ConstColor.kMainColor),
                    ),
                  ],
                ),
                height: 54,
                c: ConstColor.kSecondColor),
          ],
        ),
      ),
    );
  }
}
