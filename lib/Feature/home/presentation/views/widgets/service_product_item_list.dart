import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Core/widgets/loading/home_lead_loading.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_widget.dart';

List<String> titles = [
  'Daily',
  'weekly',
  'Monthly',
  'Yearly',
];

class ServceProductList extends StatefulWidget {
  const ServceProductList({super.key});

  @override
  State<ServceProductList> createState() => _ServceProductListState();
}

class _ServceProductListState extends State<ServceProductList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is SearchDataSucc) {
          if (state.model.data!.services!.isEmpty) {
            return const SingleChildScrollView(child: EmptyWidget());
          }

          return ListView.separated(
              // shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ProductItem(
                      // paymentStatusId: state.model.data. ?? 1,
                      isEdit: true,
                      model: state.model.data!.services![index],
                      contactDetails: state.model.data!.contactDetails!,
                      start: '', end: '',
                      // contact: state.model.data!.contactDetails!,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.model.data?.services?.length ?? 0);
        } else if (state is SearchDataError) {
          return const Center(child: FailureWidget());
        } else {
          return const CustomLoadingWidget(child: HomeLeadLoading());
        }
      },
    );
  }
}
