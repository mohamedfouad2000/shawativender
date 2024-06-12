import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Core/widgets/loading/home_lead_loading.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';

import 'package:shawativender/Feature/home/presentation/views/manager/Provider%20Serves/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/get%20requests%20serves/get_request_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/product_item_widget.dart';

class BokkingList extends StatelessWidget {
  const BokkingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRequestServesCubit, GetRequestServesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetRequestServesSucc) {
          if (state.data.data!.isEmpty) {
            return const EmptyWidget();
          }
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductItem(
                  model: state.data.data?[index].service ?? Service(),
                  paymentStatusId: state.data.data?[index].paymentStatusId ?? 1,
                  fromhome: true,
                  bookingStatus: state.data.data?[index].bookingStatusId ?? -1,
                  start: state.data.data?[index].startAt ?? '',
                  end: state.data.data?[index].endAt ?? '',

                  // contact: state.data.data!.contactDetails!,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: state.data.data?.length ?? 0);
        } else if (state is GetProviderServesError) {
          return const Center(child: FailureWidget());
        } else {
          return const Column(
            children: [
              CustomLoadingWidget(child: HomeLeadLoading()),
              SizedBox(
                height: 20,
              ),
              CustomLoadingWidget(child: HomeLeadLoading()),
            ],
          );
        }
      },
    );
  }
}
