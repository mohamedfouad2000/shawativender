import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:shawativender/Core/utils/colors.dart';

class CalendarDetails extends StatefulWidget {
  const CalendarDetails({
    super.key,
    required this.fromdate,
    required this.todate,
  });
  final String fromdate;
  final String todate;

  @override
  State<CalendarDetails> createState() => _CalendarDetailsState();
}

class _CalendarDetailsState extends State<CalendarDetails> {
  @override
  Widget build(BuildContext context) {
    //"16-04-2024,23-04-2024,24-04-2024"
    //15/05/2024
    print(widget.fromdate);
    String days = widget.fromdate
        .replaceAll('[', '')
        .replaceAll('"', '')
        .replaceAll(']', '')
        .replaceAll(' ', ' ')
        .replaceAll("\\", "")
        .trim();
    // 16-04-2024,23-04-2024,24-04-2024
    List<DateTime> Times = [];
    print(days);
    for (int i = 0; i < days.split(',').length; i++) {
      // print();

      try {
        DateTime x;

        x = DateFormat.yMd('en_US')
            .parseLoose(days.split(',')[i].trim().substring(0, 10));

        print('index is $i ${days.split(',')[i].trim()}');

        Times.add(x);

        print('Ahah is ${Times[i]}');
      } catch (e) {
        print('error is $e');
      }
    }

    return CalendarDatePicker2(
        config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.multi,
            // selectedDayTextStyle: const TextStyle(color: Colors.white),
            selectedDayHighlightColor: ConstColor.kMainColor,
            selectedRangeHighlightColor: Colors.red.shade100,
            centerAlignModePicker: true),
        onValueChanged: (value) {
          print(value);
          print(Times);
          setState(() {
            Times.remove(value);
          });
        },
        value: Times
        // onValueChanged: (dates) => _dates = dates,
        );
  }
}
