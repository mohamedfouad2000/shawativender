import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 2;

  List<String> titles = [
    'Recevied',
    'Accepted',
    'On the way',
    'On The way',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getHomeData(cateId: -1),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeSucc) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return typeItem(
                          name:
                              state.model.data?.categories?[index].brandName ??
                                  '',
                          index: state.model.data?.categories?[index].id ?? 0);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: state.model.data?.categories?.length ?? 0,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget typeItem({required String name, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          print(index);

          currentIndex = index;
          print(currentIndex);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: currentIndex == index ? ConstColor.kMainColor : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            name,
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: currentIndex == index ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
