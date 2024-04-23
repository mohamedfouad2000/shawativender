import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_widget.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/total_range.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/type_request.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomHomeAppBar(),
            SizedBox(
              height: 10,
            ),
            TotalRange(),
            // HomeSearchWidget(searchController: searchController),
            SizedBox(
              height: 10,
            ),
            TypeRequest(),
            // const CategoryWidget(),
            SizedBox(
              height: 10,
            ),
            ProductItem(),
            SizedBox(
              height: 20,
            ),
            ProductItem(),
            // const AllProducts(),
            SizedBox(
              height: 10,
            ),
            // const ProductItem(),
            SizedBox(
              height: 10,
            ),
            // const ProductItem(),
          ],
        ),
      ),
    );
  }
}
