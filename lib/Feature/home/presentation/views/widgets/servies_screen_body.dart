import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/add_service_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/booking_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/search_widget.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/service_product_item_list.dart';

import 'package:shawativender/generated/l10n.dart';

class ServicesScreenBody extends StatefulWidget {
  const ServicesScreenBody({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  State<ServicesScreenBody> createState() => _ServicesScreenBodyState();
}

class _ServicesScreenBodyState extends State<ServicesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  const CustomHomeAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchWidget(searchController: widget.searchController),
                  const SizedBox(
                    height: 20,
                  ),
                  // const CategoryList(),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // const BookingScreen(),
                  const Expanded(child: ServceProductList()),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is! SearchDataLoading)
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
                              S.of(context).ApplayFilter,
                              style: StylesData.font13
                                  .copyWith(color: ConstColor.kMainColor),
                            ),
                          ],
                        ),
                        height: 54,
                        c: ConstColor.kSecondColor),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
