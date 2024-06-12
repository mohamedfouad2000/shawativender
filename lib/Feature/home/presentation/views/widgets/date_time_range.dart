import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/search_model/event_day.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/generated/l10n.dart';

class DateTimeSchedleRange extends StatefulWidget {
  const DateTimeSchedleRange({
    super.key,
    required this.from,
  });
  final List<EventDay> from;

  @override
  State<DateTimeSchedleRange> createState() => _DateTimeSchedleRangeState();
}

class _DateTimeSchedleRangeState extends State<DateTimeSchedleRange> {
  late final FixedExtentScrollController _controller;
  // List fruitNames = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FixedExtentScrollController();
    // print("from is ${widget.from.first}");
  }
  //   for (int i = 0; i < widget.from.split(',').length; i++) {
  //     try {
  //       //dd-MM-yyyy
  //       var x = widget.from
  //           .split(',')[i]
  //           .replaceAll('[', '')
  //           .replaceAll(']', '')
  //           .replaceAll('"', '')
  //           .replaceAll('\\', '');
  //       fruitNames.add(x);

  //       print(fruitNames[i]);
  //     } catch (e) {}
  //   }
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    if (widget.from.isNotEmpty) {
      return SizedBox(
        height: 300,
        child: CupertinoPicker(
          scrollController: _controller,
          backgroundColor: Colors.white,
          itemExtent: 30.0,
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          children: [
            for (final item in widget.from)
              Center(
                  child: Text(
                LocalizationCubit.get(context).isArabic()
                    ? '${S.of(context).SAR} ${item.price.toString()} --  ${item.day.toString()}  '
                    : '${item.day.toString()}  ${item.price.toString()} ${S.of(context).SAR}',
                style: StylesData.font20.copyWith(color: Colors.blue),
              )),
          ],
          onSelectedItemChanged: (i) {},
        ),
      );
    } else {
      return const Text('');
    }
  }
}
