import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Provider%20Serves/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/price_duration.dart';

import 'package:shawativender/generated/l10n.dart';

class TypeRequestSearch extends StatefulWidget {
  const TypeRequestSearch({
    super.key,
  });

  @override
  State<TypeRequestSearch> createState() => _TypeRequestSearchState();
}

class _TypeRequestSearchState extends State<TypeRequestSearch> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> categoriesList = [
      S.of(context).colse,
      S.of(context).open,
      S.of(context).pending,
    ];
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return typeItem(
                      name: categoriesList[index],
                      namear: categoriesList[index],
                      index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: categoriesList.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget typeItem(
      {required String name, required String namear, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          print("accept is ${SearchCubit.get(context).accept}");
          currentIndex = index;
          SearchCubit.get(context).accept = index;
        });

        SearchCubit.get(context).searchData(
            accept: SearchCubit.get(context).accept ?? -1,
            lat: SearchCubit.get(context).lat ?? 0.0,
            long: SearchCubit.get(context).long ?? 0.0,
            text: SearchCubit.get(context).text ?? '',
            categoryId: SearchCubit.get(context).categoryId != -1 && SearchCubit.get(context).categoryId != null
                ? SearchCubit.get(context).categoryId.toString() ?? ''
                : '',
            minPrice: SearchCubit.get(context).minPrice != -1 && SearchCubit.get(context).minPrice != null
                ? SearchCubit.get(context).minPrice.toString() ?? ''
                : '',
            maxPrice: SearchCubit.get(context).maxPrice != -1 && SearchCubit.get(context).maxPrice != null
                ? SearchCubit.get(context).maxPrice.toString() ?? ''
                : '',
            bed: SearchCubit.get(context).bed != -1 && SearchCubit.get(context).bed != null
                ? (SearchCubit.get(context).bed! + 1).toString() ?? ''
                : '',
            floor: SearchCubit.get(context).floor != -1 && SearchCubit.get(context).floor != null
                ? (SearchCubit.get(context).floor! + 1).toString() ?? ''
                : '',
            bath: SearchCubit.get(context).bath != -1 && SearchCubit.get(context).bath != null
                ? (SearchCubit.get(context).bath! + 1).toString() ?? ''
                : '',
            priceDuration: SearchCubit.get(context).priceDuration != -1 &&
                    SearchCubit.get(context).priceDuration != null
                ? titles[SearchCubit.get(context).priceDuration!] ?? ''
                : '',
            maxarea: SearchCubit.get(context).maxarea != -1 && SearchCubit.get(context).maxarea != null
                ? SearchCubit.get(context).maxarea.toString() ?? ''
                : '',
            minarea: SearchCubit.get(context).minarea != -1 && SearchCubit.get(context).minarea != null ? SearchCubit.get(context).minarea.toString() ?? '' : '');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: currentIndex == index ? ConstColor.kMainColor : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            LocalizationCubit.get(context).isArabic() ? namear : name,
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: currentIndex == index ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
