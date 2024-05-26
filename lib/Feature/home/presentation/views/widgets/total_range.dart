import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/loading/clock_in_out_loading.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/generated/l10n.dart';

class TotalRange extends StatefulWidget {
  const TotalRange({super.key});

  @override
  State<TotalRange> createState() => _TotalRangeState();
}

class _TotalRangeState extends State<TotalRange> {
  List<double> numbers = [
    46.939,
    71,
    11,
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      S.of(context).Earnings,
      S.of(context).Bookings,
      S.of(context).services,
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeSucc) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    totalItem(
                        title: titles[0],
                        number: state.model.data?.report?.totalEarnings
                                ?.toDouble() ??
                            0.0),
                    const SizedBox(
                      width: 10,
                    ),
                    totalItem(
                        title: titles[1],
                        number: state.model.data?.report?.totalBooking
                                ?.toDouble() ??
                            0.0),
                    const SizedBox(
                      width: 10,
                    ),
                    totalItem(
                        title: titles[2],
                        number: state.model.data?.report?.totlaServices
                                ?.toDouble() ??
                            0.0),
                  ],
                )),
          );
        } else if (state is HomeError) {
          return const Text("Error");
        } else {
          return const CustomLoadingWidget(child: ClockInOutLoading());
        }
      },
    );
  }

  Container totalItem({required String title, required double number}) {
    return Container(
      height: 120,
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).Total,
            style: StylesData.font15,
          ),
          Text(title, style: StylesData.font15),
          Text("${number.toInt()}", style: StylesData.font25)
        ],
      ),
    );
  }
}
