import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/edit_service_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/map_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/date_time_range.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/test_calender.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDetailsServes extends StatefulWidget {
  const BookingDetailsServes({
    super.key,
    required this.model,
    required this.startTime,
    required this.endTime,
  });
  final Service model;
  final String startTime;
  final String endTime;

  @override
  State<BookingDetailsServes> createState() => _BookingDetailsServesState();
}

class _BookingDetailsServesState extends State<BookingDetailsServes> {
  List<DateTime> Times = [];
  List<DateTime> testDays = [];

  // CalendarController? _controller =CalendarController();
  Map<DateTime, List<dynamic>>? events;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < widget.model.eventDays!.length; i++) {
      Times.add(DateFormat.yMd('en_US').parse(widget.model.eventDays![i].day!));
    }
    if (widget.model.eventDays?.length != null &&
        // ignore: unrelated_type_equality_checks
        widget.model.eventDays != 0) {
      for (int i = 0; i < widget.model.eventDays!.length; i++) {
        Times.add(
            DateFormat.yMd('en_US').parse(widget.model.eventDays![i].day!));
      }
    }

    print(Times);
  }

  @override
  Widget build(BuildContext context) {
    print('opop');
    print('id is ${widget.model.id}');

    print("model.eventDays ${widget.model.eventDays}");
    print(widget.model.lat.toString());
    print(widget.model.lng.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingProduct(
                namear: widget.model.nameAr ?? '',
                placeAr: widget.model.placeAr ?? '',
                features: widget.model.features ?? [],
                images: widget.model.gallery ?? [],
                name: widget.model.name ?? '',
                place: widget.model.place ?? '',
                bed: widget.model.bed.toString() ?? '',
                bath: widget.model.bath.toString() ?? '',
                floor: widget.model.floor.toString() ?? '',
                clockin: widget.model.days
                        ?.split(',')
                        .first
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
                clockout: widget.model.days
                        ?.split(',')
                        .last
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
                price: widget.model.regularPrice.toString() ?? '',
                image: widget.model.image ?? ''),
            const SizedBox(
              height: 15,
            ),
            // const BookingPaymentMethod(),

            // CalendarDetails(
            //   fromdate: widget.model.days ?? '',
            //   todate: widget.model.days ?? '',
            // ),

            // const SizedBox(
            //   height: 15,
            // ),
            // Text(S.of(context).eventdays, style: StylesData.font16),
            // const SizedBox(
            //   height: 6,
            // ),

            // InkWell(
            //   onTap: () {
            //     NavegatorPush(
            //         context,
            //         TestCalender(
            //           highlightedDates: Times,
            //         ));
            //   },
            //   child: TableCalendar(
            //     firstDay: DateTime.utc(2010, 10, 16),
            //     lastDay: DateTime.utc(2030, 3, 14),
            //     focusedDay: DateTime.now(),
            //     selectedDayPredicate: (day) {
            //       return isSameDay(Times.first, day);
            //     },
            //     eventLoader: (day) {
            //       return Times;
            //     },
            //     onDaySelected: (selectedDay, focusedDay) {
            //       setState(() {
            //         // Times.first = selectedDay;
            //         // Times.first = focusedDay; // update `_focusedDay` here as well
            //       });
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(S.of(context).AvailableDays, style: StylesData.font11),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: ConstColor.kMainColor,
                  radius: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(S.of(context).eventdays, style: StylesData.font11),
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              ],
            ),
            // Container(
            //   color: Colors.white,
            //   child: SfDateRangePicker(
            //     onSubmit: (p0) => print(p0),
            //     showActionButtons: true,
            //     onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            //       setState(() {
            //         print(args);
            //         testDays = args.value.cast<DateTime>();
            //       });
            //     },
            //     selectionMode: DateRangePickerSelectionMode.multiRange,
            //   ),
            // ),
            // TextButton(
            //     onPressed: () {
            //       print(testDays);
            //     },
            //     child: const Text("aha")),

            const SizedBox(
              height: 5,
            ),
            TestCalender(
              highlightedDates: Times,
              days: widget.model.days ?? '',
            ),

            // CalendarDatePicker2(
            //     config: CalendarDatePicker2Config(
            //         calendarType: CalendarDatePicker2Type.multi,
            //         selectedDayHighlightColor: Colors.red,
            //         selectedRangeHighlightColor: Colors.red.shade100,
            //         centerAlignModePicker: true),
            //     onValueChanged: (value) {
            //       print("aha");
            //       showEventsDays(context);
            //       print(value);
            //       print(Times);
            //       setState(() {
            //         Times.remove(value);
            //       });
            //     },
            //     value: Times
            //     // onValueChanged: (dates) => _dates = dates,
            //     ),
            // // i
            // DateTimeSchedleRange(from: widget.model.eventDays ?? []),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("object");
                NavegatorPush(
                    context,
                    MapScreen(
                        latLng: LatLng(
                            widget.model.lat != ''
                                ? double.parse(widget.model.lat.toString())
                                : 0,
                            widget.model.lng != ''
                                ? double.parse(widget.model.lng.toString())
                                : 0)));
              },
              child: SizedBox(
                height: 300,
                child: MapFlutter(
                  latLng: LatLng(
                      widget.model.lat != ''
                          ? double.parse(widget.model.lat.toString())
                          : 0,
                      widget.model.lng != ''
                          ? double.parse(widget.model.lng.toString())
                          : 0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // if(widget.model.userId ==)
            InkWell(
              onTap: () {
                NavegatorPush(context, EditServiceScreen(model: widget.model));
              },
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xffD0DAF0),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                  child: Text(
                    S.of(context).edit_service,
                    style: StylesData.font17
                        .copyWith(color: ConstColor.kMainColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showEventsDays(context) {
    var x = AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        S.of(context).eventdays,
      ),
      content: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 150,
                  child: widget.model.eventDays!.isNotEmpty
                      ? ListView.builder(
                          itemCount: widget.model.eventDays!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Text(
                                LocalizationCubit.get(context).isArabic()
                                    ? ' ${S.of(context).SAR} ${widget.model.eventDays?[index].price.toString()}    ${widget.model.eventDays?[index].day?.substring(0, 10)}'
                                    : '${widget.model.eventDays?[index].day.toString().substring(0, 10)}    ${widget.model.eventDays?[index].price} ${S.of(context).SAR}',
                              ),
                            );
                          },
                        )
                      : Text(S.of(context).NoData)),
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return x;
        });
  }
}
