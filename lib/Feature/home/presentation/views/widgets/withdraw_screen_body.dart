import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/size_config.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/with%20Draw/with_draw_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/add_withdraw_form.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/date_time_widget.dart';
import 'package:shawativender/generated/l10n.dart';

class WIthDrawScreenBody extends StatefulWidget {
  const WIthDrawScreenBody({
    super.key,
  });
//GetAllrequestsSucc
  @override
  State<WIthDrawScreenBody> createState() => _WIthDrawScreenBodyState();
}

class _WIthDrawScreenBodyState extends State<WIthDrawScreenBody> {
  Map<int, Color> statusColor = {
    2: const Color(0xff7239EA),
    1: const Color(0xff50CD89),
    0: const Color(0xffF1416C),
  };
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    Map<int, String> statusText = {
      2: S.of(context).pending,
      1: S.of(context).Approved,
      0: S.of(context).Rejected,
    };

    List<String> categoriesList = [
      S.of(context).pending,
      S.of(context).Approved,
      S.of(context).Reject,
    ];
    return BlocProvider(
      create: (context) =>
          WithDrawCubit(HomeRepoImpl())..getWithDrawRequests(catId: -1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryWithWrapeWidget(categoriesList),
            const SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (context) =>
                  WithDrawCubit(HomeRepoImpl())..getWithDrawBalance(),
              child: BlocConsumer<WithDrawCubit, WithDrawState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is GetBalanceSucc) {
                    return Text(
                      '${S.of(context).YourBalance}: ${state.balance}',
                      style: StylesData.font16.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    );
                  } else if (state is GetBalanceError) {
                    return Container();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: BlocConsumer<WithDrawCubit, WithDrawState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is GetAllrequestsSucc) {
                    if (state.model.data!.isEmpty) {
                      return const Center(
                        child: EmptyWidget(),
                      );
                    }
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, right: 8, left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${S.of(context).Request} ",
                                        maxLines: 1,
                                        style: StylesData.font24Google,
                                      )
                                          .animate()
                                          .scale(curve: Curves.easeInOutQuad)
                                          .show(duration: 500.ms),
                                    ),
                                    Text(
                                      '${statusText[state.model.data?[index].status]}',
                                      style: StylesData.font16raleway.copyWith(
                                          color: ConstColor.kMainColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DataTimeWidget(
                                    time: state.model.data?[index].createdAt
                                            .toString()
                                            .substring(11, 19)
                                            .toString() ??
                                        '',
                                    day: state.model.data?[index].createdAt
                                            .toString()
                                            .substring(0, 10)
                                            .toString() ??
                                        ''),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${S.of(context).amount}: ",
                                      style: StylesData.font14.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    )
                                        .animate()
                                        .addEffect(const AlignEffect(
                                            curve: Curves.bounceIn))
                                        .scale(curve: Curves.easeInOutQuad),
                                    Expanded(
                                      child: Text(
                                        LocalizationCubit.get(context)
                                                .isArabic()
                                            ? "${state.model.data?[index].amount.toString()} ${S.of(context).SAR}  "
                                            : "${S.of(context).SAR} ${state.model.data?[index].amount.toString()} ",
                                        maxLines: 1,
                                        style: StylesData.font18.copyWith(
                                            color: ConstColor.kMainColor,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: state.model.data?.length ?? 0,
                    );
                  } else if (state is GetAllrequestsError) {
                    return const FailureWidget();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: BlocProvider(
            //       create: (context) =>
            //           WithDrawCubit(HomeRepoImpl())..getWithDrawRequests(),
            //       child: BlocConsumer<WithDrawCubit, WithDrawState>(
            //         listener: (context, state) {
            //           // TODO: implement listener
            //         },
            //         builder: (context, state) {
            //           if (state is GetAllrequestsSucc) {
            //             if (state.model.data!.isEmpty) {
            //               return const Center(
            //                 child: EmptyWidget(),
            //               );
            //             }
            //             return Column(
            //               children: [
            //                 SingleChildScrollView(
            //                   child: SingleChildScrollView(
            //                       scrollDirection: Axis.horizontal,
            //                       child: DataTable(
            //                           sortAscending: true,
            //                           columnSpacing: 16.0,
            //                           dataRowMaxHeight: double.infinity,
            //                           dataRowMinHeight: 71,
            //                           dividerThickness: 1,
            //                           border: TableBorder(
            //                             horizontalInside: const BorderSide(
            //                                 color: Colors.white, width: 20),
            //                             borderRadius: BorderRadius.circular(10),
            //                           ),
            //                           dataRowColor: MaterialStateProperty
            //                               .resolveWith<Color?>(
            //                                   (Set<MaterialState> states) {
            //                             if (states
            //                                 .contains(MaterialState.selected)) {
            //                               return ConstColor.kMainColor;
            //                             }
            //                             return null; // Use the default value.
            //                           }),
            //                           columns: [
            //                             DataColumn(
            //                               label: Container(
            //                                 width: 150,
            //                                 height: 50,
            //                                 decoration: ShapeDecoration(
            //                                   color: ConstColor.kMainColor,
            //                                   shape: RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(15),
            //                                   ),
            //                                 ),
            //                                 child: Center(
            //                                   child: Text(
            //                                     S.of(context).amount,
            //                                     style: StylesData.font12.copyWith(
            //                                         color: Colors.white),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                             // DataColumn(
            //                             //   label: Container(
            //                             //     width: 150,
            //                             //     height: 50,
            //                             //     decoration: ShapeDecoration(
            //                             //       color: ConstColor.kMainColor,
            //                             //       shape: RoundedRectangleBorder(
            //                             //         borderRadius: BorderRadius.circular(15),
            //                             //       ),
            //                             //     ),
            //                             //     child: Center(
            //                             //       child: Text(
            //                             //         S.of(context).provider,
            //                             //         style: StylesData.font12
            //                             //             .copyWith(color: Colors.white),
            //                             //       ),
            //                             //     ),
            //                             //   ),
            //                             // ),

            //                             DataColumn(
            //                               label: Container(
            //                                 width: 150,
            //                                 height: 50,
            //                                 decoration: ShapeDecoration(
            //                                   color: ConstColor.kMainColor,
            //                                   shape: RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(15),
            //                                   ),
            //                                 ),
            //                                 child: Center(
            //                                   child: Text(
            //                                     S.of(context).requestTime,
            //                                     style: StylesData.font12.copyWith(
            //                                         color: Colors.white),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                             DataColumn(
            //                               label: Container(
            //                                 width: 150,
            //                                 height: 50,
            //                                 decoration: ShapeDecoration(
            //                                   color: ConstColor.kMainColor,
            //                                   shape: RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(15),
            //                                   ),
            //                                 ),
            //                                 child: Center(
            //                                   child: Text(
            //                                     S.of(context).status,
            //                                     style: StylesData.font12.copyWith(
            //                                         color: Colors.white),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                           rows: List<DataRow>.generate(
            //                             state.model.data?.length ?? 0,
            //                             (index) => DataRow(cells: [
            //                               DataCell(SizedBox(
            //                                   width: 150,
            //                                   child: Center(
            //                                       child: Text(state.model
            //                                               .data?[index].amount
            //                                               .toString() ??
            //                                           '')))),
            //                               // DataCell(SizedBox(
            //                               //     width: 150,
            //                               //     child: Center(
            //                               //         child: Text(state
            //                               //                 .model.data?[index].user
            //                               //                 .toString() ??
            //                               //             '')))),

            //                               DataCell(SizedBox(
            //                                   width: 150,
            //                                   child: Center(
            //                                       child: Text(state.model
            //                                               .data?[index].createdAt
            //                                               .toString()
            //                                               .substring(0, 16) ??
            //                                           '')))),
            //                               DataCell(SizedBox(
            //                                   width: 150,
            //                                   child: Center(
            //                                     child: Container(
            //                                       padding:
            //                                           const EdgeInsets.symmetric(
            //                                               vertical: 8,
            //                                               horizontal: 6),
            //                                       decoration: BoxDecoration(
            //                                           color: statusColor[state
            //                                               .model
            //                                               .data?[index]
            //                                               .status],
            //                                           borderRadius:
            //                                               BorderRadius.circular(
            //                                                   15)),
            //                                       child: FittedBox(
            //                                           child: Text(
            //                                         statusText[state
            //                                                 .model
            //                                                 .data?[index]
            //                                                 .status] ??
            //                                             '',
            //                                         style: StylesData.font12
            //                                             .copyWith(
            //                                                 color: Colors.white),
            //                                       )),
            //                                     ),
            //                                   ))),
            //                             ]),
            //                           ))),
            //                 ),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             );
            //           } else if (state is GetBalanceError) {
            //             return const FailureWidget();
            //           } else {
            //             return const Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           }
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
                fun: () {
                  cutsomShowModelSheet();
                },
                textWidget: Text(
                  S.of(context).Add_wIthdraw,
                  style: StylesData.font13,
                ),
                c: ConstColor.kMainColor)
          ],
        ),
      ),
    );
  }

  SizedBox categoryWithWrapeWidget(List<String> categoriesList) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              int x = 0;
              setState(() {
                currentIndex = index;
              });
              if (currentIndex == 0) {
                x = 2;
              } else if (currentIndex == 1) {
                x = 1;
              } else if (currentIndex == 2) {
                x = 0;
              } else {
                x = -1;
              }
              BlocProvider.of<WithDrawCubit>(context)
                  .getWithDrawRequests(catId: x);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: currentIndex == index
                      ? ConstColor.kMainColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(
                child: Text(
                  categoriesList[index].toString(),
                  style: StylesData.font17.copyWith(
                      fontSize: 15,
                      color:
                          currentIndex == index ? Colors.white : Colors.black),
                )
                    .animate()
                    .addEffect(const AlignEffect(curve: Curves.bounceIn))
                    .scale(curve: Curves.easeInOutQuad),
              ),
            ),
          );
          // return null;
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemCount: categoriesList.length,
      ),
    );
  }

  void cutsomShowModelSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        barrierColor:
            Colors.black.withOpacity(0.4000000059604645).withOpacity(0.3),
        builder: (context) => Container(
            color: Colors.white,
            height: SizeConfig.screenHeight!,
            child: const SingleChildScrollView(
              child: AddWithDrawForm(),
            )));
  }
}
