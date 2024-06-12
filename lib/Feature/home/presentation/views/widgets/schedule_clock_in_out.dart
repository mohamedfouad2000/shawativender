// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:shawativender/Core/utils/assets_data.dart';
// import 'package:shawativender/Core/utils/colors.dart';
// import 'package:shawativender/Core/utils/styles.dart';
// import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
// import 'package:shawativender/generated/l10n.dart';

// class ScheduleClockInOut extends StatefulWidget {
//   const ScheduleClockInOut({super.key, required this.from, required this.to});
//   final String from;
//   final String to;

//   @override
//   State<ScheduleClockInOut> createState() => _ScheduleClockInOutState();
// }

// class _ScheduleClockInOutState extends State<ScheduleClockInOut> {
//   List<DateTime> Times = [];

//   // Function to check if a date is selectable
//   bool _isSelectable(DateTime day) {
//     print(day);
//     return Times.contains(day);
//   }

//   bool _isSelectableDate(DateTime day) {
//     // Define the logic to determine which dates are selectable
//     // For example, let's allow only even days in the month of May 2024
//     if (day.year == 2024 && day.month == 5) {
//       return day.day.isOdd;
//     }
//     // By default, all other dates are selectable
//     return true;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     for (int i = 0; i < widget.from.split(',').length; i++) {
//       try {
//         //dd-MM-yyyy
//         var x = DateFormat("MM/dd/yyyy").parse(widget.from.split(',')[i]);
//         Times.add(x);

//         print(Times[i]);
//       } catch (e) {}
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: Times.isNotEmpty ? Times.first : DateTime.now(),
//               firstDate: Times.isNotEmpty ? Times.first : DateTime.now(),
//               lastDate: BlocProvider.of<BookingCubit>(context).checkout ??
//                   (Times.isNotEmpty
//                       ? Times.last
//                       : DateTime.now().add(const Duration(days: 30))),
//             );

//             if (pickedDate != null) {
//               print(
//                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//               String formattedDate =
//                   DateFormat('dd/MMMM/yyyy').format(pickedDate);
//               print(
//                   formattedDate); //formatted date output using intl package =>  2021-03-16
//               setState(() {
//                 BlocProvider.of<BookingCubit>(context)
//                     .changecheckin(pickedDate);
//               });
//               // CreationDatecont.text =
//               //     formattedDate; //set output date to TextField value.
//             } else {}
//           },
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//             decoration: BoxDecoration(
//               // color: const Color(0xffE9F0FF),
//               borderRadius: BorderRadius.circular(23),
//               // color: const Color(0xffE9F0FF),
//               border: Border.all(color: ConstColor.kMainColor),
//             ),
//             child: Row(
//               children: [
//                 const ImageIcon(
//                   AssetImage(
//                     AssetsData.note,
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     " ${S.of(context).CHECKIN}",
//                     style: StylesData.font13.copyWith(color: Colors.black),
//                   ),
//                 ),
//                 Text(
//                   DateFormat('MMMM dd').format(
//                           BlocProvider.of<BookingCubit>(context).checkin ??
//                               DateTime.now()) ??
//                       '',
//                   style: StylesData.font13.copyWith(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 18,
//         ),
//         InkWell(
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//               initialDate: BlocProvider.of<BookingCubit>(context).checkin ??
//                   (Times.isNotEmpty ? Times.first : DateTime.now()),

//               firstDate: BlocProvider.of<BookingCubit>(context).checkin ??
//                   (Times.isNotEmpty ? Times.first : DateTime.now()),
//               lastDate: Times.isNotEmpty
//                   ? Times.last
//                   : DateTime.now().add(
//                       const Duration(days: 30),
//                     ),
//               context: context,

//               // selectableDayPredicate: _isSelectableDate,

//               //DateTime.now() - not to allow to choose before today.
//             );

//             if (pickedDate != null) {
//               print(
//                   pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//               String formattedDate =
//                   DateFormat('dd/MMMM/yyyy').format(pickedDate);
//               print(
//                   formattedDate); //formatted date output using intl package =>  2021-03-16
//               setState(() {
//                 BlocProvider.of<BookingCubit>(context)
//                     .changecheckout(pickedDate);
//               });
//               // CreationDatecont.text =
//               //     formattedDate; //set output date to TextField value.
//             } else {}
//           },
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//             decoration: BoxDecoration(
//               // color: const Color(0xffE9F0FF),
//               borderRadius: BorderRadius.circular(23),
//               // color: const Color(0xffE9F0FF),
//               border: Border.all(color: ConstColor.kMainColor),
//             ),
//             child: Row(
//               children: [
//                 ImageIcon(
//                   const AssetImage(
//                     AssetsData.clock,
//                   ),
//                   color: ConstColor.kMainColor,
//                 ),
//                 Expanded(
//                   child: Text(
//                     S.of(context).CHECKOUT,
//                     style: StylesData.font13.copyWith(color: Colors.black),
//                   ),
//                 ),
//                 Text(
//                   DateFormat('MMMM dd').format(
//                           BlocProvider.of<BookingCubit>(context).checkout ??
//                               DateTime.now()) ??
//                       '',
//                   style: StylesData.font13.copyWith(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
