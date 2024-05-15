import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/cubit/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';

import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_list.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepoImpl())..getHomeData(cateId: -1),
        ),
        BlocProvider(
          create: (context) => GetProviderServesCubit(HomeRepoImpl())
            ..getProviderServes(catId: 0),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HomeCubit>(context).getHomeData(cateId: -1);
              BlocProvider.of<GetProviderServesCubit>(context)
                  .getProviderServes(catId: 0);

              BlocProvider.of<ProfileCubit>(context).getProfileData();
            },
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomHomeAppBar(),
                    SizedBox(
                      height: 10,
                    ),
                    TotalRange(),
                    SizedBox(
                      height: 10,
                    ),
                    TypeRequest(),
                    SizedBox(
                      height: 10,
                    ),
                    // ProductItem(),

                    ProductItemList(),

                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
