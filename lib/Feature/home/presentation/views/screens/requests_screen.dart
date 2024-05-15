import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/rental.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/get%20requests%20serves/get_request_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/request_item.dart';
import 'package:shawativender/generated/l10n.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({
    super.key,
    required this.serviceId,
  });
  final int serviceId;
  // final int reqId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: Text(S.of(context).requests)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) =>
              GetRequestServesCubit(HomeRepoImpl())..getRequests(id: serviceId),
          child: BlocConsumer<GetRequestServesCubit, GetRequestServesState>(
            listener: (context, state) {
              if (state is setRequestServesSucc) {
                showToast(msq: state.msq);
                BlocProvider.of<GetRequestServesCubit>(context)
                    .getRequests(id: serviceId);
                // Nav(context, const HomeView(currentidex: 0));
              } else if (state is setRequestServesError) {
                showToast(msq: state.error);
                BlocProvider.of<GetRequestServesCubit>(context)
                    .getRequests(id: serviceId);
                // Nav(context, const HomeView(currentidex: 0));
              }
            },
            builder: (context, state) {
              if (state is GetRequestServesSucc) {
                if (state.data.data!.rental!.isEmpty) {
                  return const Expanded(child: Center(child: EmptyWidget()));
                }
                return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          RequestItem(
                            model: state.data.data?.rental?[index] ?? Rental(),
                            proImage: state
                                    .data.data?.rental?[index].service?.image
                                    ?.split(',')
                                    .first
                                    .toString() ??
                                '',
                            text: state.data.data?.rental?[index].service
                                    ?.description
                                    .toString() ??
                                '',
                            textAr: state.data.data?.rental?[index].service
                                    ?.descriptionAr
                                    .toString() ??
                                '',

                            date: state.data.data?.rental?[index].service?.days
                                    ?.split(',')
                                    .first
                                    .toString() ??
                                '',
                            //10/12/2023 ,11/12/2023
                            image: state
                                    .data.data?.rental?[index].customer?.image
                                    .toString() ??
                                '',
                            name: state.data.data?.rental?[index].customer?.name
                                    .toString() ??
                                '',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Builder(builder: (context) {
                                if (state.data.data?.rental?[index]
                                        .paymentStatusId ==
                                    2) {
                                  return Flexible(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              BlocProvider.of<
                                                          GetRequestServesCubit>(
                                                      context)
                                                  .setBookingStatus(
                                                      id: state
                                                              .data
                                                              .data
                                                              ?.rental?[index]
                                                              .id ??
                                                          0,
                                                      customerId: state
                                                              .data
                                                              .data
                                                              ?.rental?[index]
                                                              .customerId ??
                                                          0,
                                                      status: 1);
                                              // NavegatorPush(context, const RequestState());
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: ConstColor.kMainColor),
                                              child: Center(
                                                child: Text(
                                                  S.of(context).Confirm,
                                                  style: StylesData.font14
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              BlocProvider.of<
                                                          GetRequestServesCubit>(
                                                      context)
                                                  .setBookingStatus(
                                                      id: state
                                                              .data
                                                              .data
                                                              ?.rental?[index]
                                                              .id ??
                                                          0,
                                                      customerId: state
                                                              .data
                                                              .data
                                                              ?.rental?[index]
                                                              .customerId ??
                                                          0,
                                                      status: 0);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: const Color.fromARGB(
                                                      255, 207, 151, 29)),
                                              child: Center(
                                                child: Text(
                                                  S.of(context).Reject,
                                                  style: StylesData.font14
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Flexible(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: 48,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: state
                                                            .data
                                                            .data
                                                            ?.rental?[index]
                                                            .paymentStatusId ==
                                                        3
                                                    ? Colors.green
                                                    : const Color.fromARGB(
                                                        255, 207, 29, 29)),
                                            child: Center(
                                              child: Text(
                                                state.data.data?.rental?[index]
                                                            .paymentStatusId ==
                                                        3
                                                    ? S
                                                        .of(context)
                                                        .AlreadyAccept
                                                    : S
                                                        .of(context)
                                                        .AlreadyReject,
                                                style: StylesData.font14
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  state.data.data?.rental?[index].updatedAt
                                          .toString()
                                          .substring(0, 10) ??
                                      '',
                                  textAlign: TextAlign.center,
                                  style: StylesData.font16.copyWith(
                                      color: const Color(0xffD83A3A),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: state.data.data?.rental?.length ?? 0);
              } else if (state is GetRequestServesError) {
                return Text(state.error);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
