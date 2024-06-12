import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/datum.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
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
          create: (context) => GetRequestServesCubit(HomeRepoImpl())
            ..getRequests(id: serviceId, status: -1),
          child: BlocConsumer<GetRequestServesCubit, GetRequestServesState>(
            listener: (context, state) {
              if (state is setRequestServesSucc) {
                showToast(
                    msq: LocalizationCubit.get(context).isArabic()
                        ? S.of(context).Successfull
                        : state.msq.toString());
                BlocProvider.of<GetRequestServesCubit>(context)
                    .getRequests(id: serviceId, status: -1);
                // Nav(context, const HomeView(currentidex: 0));
              } else if (state is setRequestServesError) {
                showToast(
                    msq: LocalizationCubit.get(context).isArabic()
                        ? S.of(context).oppsMessage
                        : state.error.toString());
                BlocProvider.of<GetRequestServesCubit>(context)
                    .getRequests(id: serviceId, status: -1);
              }
            },
            builder: (context, state) {
              if (state is GetRequestServesSucc) {
                if (state.data.data!.isEmpty) {
                  return const Center(child: EmptyWidget());
                }
                return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          RequestItem(
                            paymentStatusId:
                                state.data.data?[index].paymentStatusId ?? 0,
                            model: state.data.data?[index] ?? DatumRequests(),
                            proImage: state.data.data?[index].service?.image
                                    ?.split(',')
                                    .first
                                    .toString() ??
                                '',
                            text: state.data.data?[index].service?.name
                                    .toString() ??
                                '',
                            textAr: state.data.data?[index].service?.nameAr
                                    .toString() ??
                                '',

                            date: state.data.data?[index].service?.days
                                    ?.split(',')
                                    .first
                                    .toString() ??
                                '',
                            //10/12/2023 ,11/12/2023
                            image: state.data.data?[index].customer?.image
                                    .toString() ??
                                '',
                            name: state.data.data?[index].customer?.name
                                    .toString() ??
                                '',
                            payment:
                                state.data.data?[index].paymentStatusId ?? 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Builder(builder: (context) {
                                print(
                                    "aha is ya ahha ${state.data.data![index].paymentStatusId}");
                                if (state.data.data![index].bookingStatusId !=
                                        3 &&
                                    state.data.data![index].bookingStatusId !=
                                        4) {
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
                                                              .data?[index]
                                                              .id ??
                                                          0,
                                                      customerId: state
                                                              .data
                                                              .data?[index]
                                                              .customerId ??
                                                          0,
                                                      status: 3);
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
                                                              .data?[index]
                                                              .id ??
                                                          0,
                                                      customerId: state
                                                              .data
                                                              .data?[index]
                                                              .customerId ??
                                                          0,
                                                      status: 4);
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
                                                color: state.data.data?[index]
                                                            .bookingStatusId ==
                                                        3
                                                    ? Colors.green
                                                    : const Color.fromARGB(
                                                        255, 207, 29, 29)),
                                            child: Center(
                                              child: Text(
                                                state.data.data?[index]
                                                            .bookingStatusId ==
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
                                  state.data.data?[index].updatedAt
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
                    itemCount: state.data.data?.length ?? 0);
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
