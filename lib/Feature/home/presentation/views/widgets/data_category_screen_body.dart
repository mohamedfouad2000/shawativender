import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_list.dart';

class DataCategoryScreenBody extends StatelessWidget {
  const DataCategoryScreenBody({super.key, required this.cateId});
  final int cateId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl())..getHomeData(cateId: cateId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Title'),
                SizedBox(
                  height: 10,
                ),
                // ProductItemList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
