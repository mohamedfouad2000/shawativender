import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Core/widgets/loading/home_lead_loading.dart';

import 'package:shawativender/Feature/home/presentation/views/manager/cubit/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_widget.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProviderServesCubit, GetProviderServesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetProviderServesSuccess) {
          if (state.data.data!.isEmpty) {
            return const EmptyWidget();
          }
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductItem(
                  model: state.data.data![index],
                  // contact: state.data.data!.contactDetails!,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.data.data?.length ?? 0);
        } else if (state is GetProviderServesError) {
          return const Center(child: FailureWidget());
        } else {
          return const CustomLoadingWidget(child: HomeLeadLoading());
        }
      },
    );
  }
}
