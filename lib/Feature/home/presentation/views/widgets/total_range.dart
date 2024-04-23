import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/styles.dart';

class TotalRange extends StatefulWidget {
  const TotalRange({super.key});

  @override
  State<TotalRange> createState() => _TotalRangeState();
}

class _TotalRangeState extends State<TotalRange> {
  List<String> titles = [
    'Earnings',
    'Bookings',
    'services',
  ];
  List<double> numbers = [
    46.939,
    71,
    11,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return totalItem(title: titles[index], number: numbers[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: 3,
      ),
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
            "Total",
            style: StylesData.font15,
          ),
          Text(title, style: StylesData.font15),
          Text("$number", style: StylesData.font25)
        ],
      ),
    );
  }
}
