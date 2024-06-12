// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:shawativender/Core/utils/colors.dart';
// import 'package:shawativender/Core/utils/components.dart';
// import 'package:shawativender/Core/utils/styles.dart';
// import 'package:shawativender/Core/widgets/empty_wid.dart';
// import 'package:shawativender/Feature/home/data/model/booking_model/rental.dart';
// import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
// import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
// import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
// import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
// import 'package:shawativender/Feature/home/presentation/views/screens/add_service_screen.dart';
// import 'package:shawativender/Feature/home/presentation/views/screens/booking_details.dart';
// // import 'package:shawativender/Feature/home/presentation/views/screens/booking_details.dart';
// import 'package:shawativender/Feature/home/presentation/views/widgets/custom_appbar_booking.dart';
// import 'package:shawativender/Feature/home/presentation/views/widgets/product_data.dart';
// import 'package:shawativender/Feature/login/presentation/views/login_view.dart';
// import 'package:shawativender/generated/l10n.dart';

// class BookingScreen extends StatelessWidget {
//   const BookingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // const CustomBookingAppBar(),
//           // const SizedBox(
//           //   height: 15,
//           // ),

//           BlocProvider(
//             create: (context) => BookingCubit(HomeRepoImpl())..getBookingData(),
//             child: BlocConsumer<BookingCubit, BookingState>(
//               listener: (context, state) {
//                 if (state is BookingError) {
//                   // showToast(msq: "Opps :Please Login Again ");
//                   // Nav(context, const LoginView());
//                 }
//               },
//               builder: (context, state) {
//                 if (state is BookingSucc) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // if (state.Model.data!.rental!.isNotEmpty)
//                       // Text(
//                       //   S.of(context).UpcomingBooking,
//                       //   style: StylesData.font18,
//                       // ),
//                       // // if (state.Model.data!.upcoming!.isNotEmpty)
//                       // const SizedBox(
//                       //   height: 10,
//                       // ),
//                       // if (state.Model.data!.upcoming!.isEmpty)
//                       //   const EmptyWidget(),

//                       // if (state.Model.data!.upcoming!.isNotEmpty)
//                       //   ListView.separated(
//                       //     shrinkWrap: true,
//                       //     physics: const NeverScrollableScrollPhysics(),
//                       //     itemBuilder: (BuildContext context, int index) {
//                       //       return Stack(
//                       //         alignment: Alignment.bottomRight,
//                       //         children: [
//                       //           ProductData(
//                       //               method: state.Model.data?.upcoming?[index]
//                       //                       .paymentStatusId
//                       //                       .toString() ??
//                       //                   '0',
//                       //               title: state.Model.data?.upcoming?[index]
//                       //                       .service?.name ??
//                       //                   '',
//                       //               subTitlearab: state
//                       //                       .Model
//                       //                       .data
//                       //                       ?.upcoming?[index]
//                       //                       .service
//                       //                       ?.place ??
//                       //                   '',
//                       //               titlearab: state
//                       //                       .Model
//                       //                       .data
//                       //                       ?.upcoming?[index]
//                       //                       .service
//                       //                       ?.nameAr ??
//                       //                   '',
//                       //               subTitle: state
//                       //                       .Model
//                       //                       .data
//                       //                       ?.upcoming?[index]
//                       //                       .service
//                       //                       ?.place ??
//                       //                   '',
//                       //               image: state.Model.data?.upcoming?[index].service?.image ?? '',
//                       //               money: state.Model.data?.upcoming?[index].service?.commissionMoney.toString() ?? ''),
//                       //           Positioned(
//                       //             right: LocalizationCubit.get(context)
//                       //                     .isArabic()
//                       //                 ? 0
//                       //                 : 9,
//                       //             bottom: 8,
//                       //             left: LocalizationCubit.get(context)
//                       //                     .isArabic()
//                       //                 ? 9
//                       //                 : 0,
//                       //             child: Column(
//                       //               crossAxisAlignment:
//                       //                   CrossAxisAlignment.end,
//                       //               children: [
//                       //                 InkWell(
//                       //                   onTap: () {
//                       //                     NavegatorPush(
//                       //                         context,
//                       //                         BookingDetailsScreen(
//                       //                           model: state
//                       //                               .Model
//                       //                               .data!
//                       //                               .upcoming![index]
//                       //                               .service!,
//                       //                         ));
//                       //                   },
//                       //                   child: Padding(
//                       //                     padding: EdgeInsets.only(
//                       //                         top: 10,
//                       //                         left: LocalizationCubit.get(
//                       //                                     context)
//                       //                                 .isArabic()
//                       //                             ? 0
//                       //                             : 10,
//                       //                         bottom: 10),
//                       //                     child: Icon(
//                       //                         Icons.arrow_forward_ios_rounded,
//                       //                         size: 22,
//                       //                         color: ConstColor.kMainColor),
//                       //                   ),
//                       //                 ),
//                       //                 Text(
//                       //                   state.Model.data?.upcoming?[index]
//                       //                           .service?.createdAt
//                       //                           .toString()
//                       //                           .substring(0, 16) ??
//                       //                       '',
//                       //                   style: StylesData.font12,
//                       //                 )
//                       //               ],
//                       //             ),
//                       //           )
//                       //         ],
//                       //       );
//                       //     },
//                       //     separatorBuilder:
//                       //         (BuildContext context, int index) {
//                       //       return const SizedBox(
//                       //         height: 10,
//                       //       );
//                       //     },
//                       //     itemCount: state.Model.data?.upcoming?.length ?? 0,
//                       //   ),

//                       // const SizedBox(
//                       //   height: 10,
//                       // ),
//                       // if (state.Model.data!.rental!.isNotEmpty)
//                       //   Text(
//                       //     S.of(context).RentalHistory,
//                       //     style: StylesData.font18,
//                       //   ),
//                       // // if (state.Model.data!.rental!.isNotEmpty)
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       // if (state.Model.data!.rental!.isEmpty)
//                       // const EmptyWidget(),
//                       if (state.Model.data!.rental!.isNotEmpty)
//                         ListView.separated(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (BuildContext context, int index) {
//                             return Stack(
//                               alignment: Alignment.bottomRight,
//                               children: [
//                                 ProductData(
//                                     method: state.Model.data?.rental?[index]
//                                             .paymentStatusId
//                                             .toString() ??
//                                         '0',
//                                     subTitlearab: state.Model.data
//                                             ?.rental?[index].service?.place ??
//                                         '',
//                                     titlearab: state.Model.data?.rental?[index]
//                                             .service?.name ??
//                                         '',
//                                     title: state.Model.data?.rental?[index]
//                                             .service?.name ??
//                                         '',
//                                     subTitle: state.Model.data?.rental?[index]
//                                             .service?.place ??
//                                         '',
//                                     image: state.Model.data?.rental?[index].service?.image ?? '',
//                                     money: state.Model.data?.rental?[index].service?.commissionMoney.toString() ?? ''),
//                                 Positioned(
//                                   right:
//                                       LocalizationCubit.get(context).isArabic()
//                                           ? 0
//                                           : 9,
//                                   bottom: 8,
//                                   left:
//                                       LocalizationCubit.get(context).isArabic()
//                                           ? 9
//                                           : 0,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           // NavegatorPush(
//                                           //     context,
//                                           //     BookingDetailsScreen(
//                                           //       model: state
//                                           //           .Model.data!.rental![index],
//                                           //     ));
//                                         },
//                                         child: Padding(
//                                           padding: EdgeInsets.only(
//                                               top: 10,
//                                               left:
//                                                   LocalizationCubit.get(context)
//                                                           .isArabic()
//                                                       ? 0
//                                                       : 10,
//                                               bottom: 10),
//                                           child: Icon(
//                                               Icons.arrow_forward_ios_rounded,
//                                               size: 22,
//                                               color: ConstColor.kMainColor),
//                                         ),
//                                       ),
//                                       Text(
//                                         state.Model.data?.rental?[index].service
//                                                 ?.createdAt
//                                                 .toString()
//                                                 .substring(0, 16) ??
//                                             '',
//                                         style: StylesData.font12,
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return const SizedBox(
//                               height: 10,
//                             );
//                           },
//                           itemCount: state.Model.data?.rental?.length ?? 0,
//                         ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       // defaultButton(
//                       //     fun: () {
//                       //       NavegatorPush(context, const AddServiceScreen());
//                       //     },
//                       //     textWidget: Row(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: [
//                       //         Icon(
//                       //           Icons.add_circle_outline_sharp,
//                       //           color: ConstColor.kMainColor,
//                       //         ),
//                       //         const SizedBox(
//                       //           width: 10,
//                       //         ),
//                       //         Text(
//                       //           S.of(context).ApplayFilter,
//                       //           style: StylesData.font13
//                       //               .copyWith(color: ConstColor.kMainColor),
//                       //         ),
//                       //       ],
//                       //     ),
//                       //     height: 54,
//                       //     c: ConstColor.kSecondColor),
//                     ],
//                   );
//                 } else if (state is BookingError) {
//                   return Text(state.msg);
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ),
//           // const SizedBox(
//           //   height: 40,
//           // ),
//           // Text(
//           //   "Rental history",
//           //   style: StylesData.font18,
//           // ),
//           // const SizedBox(
//           //   height: 10,
//           // ),
//           // Stack(
//           //   alignment: Alignment.bottomRight,
//           //   children: [
//           //     const ProductItem(),
//           //     Positioned(
//           //       right: 9,
//           //       bottom: 8,
//           //       child: Column(
//           //         crossAxisAlignment: CrossAxisAlignment.end,
//           //         children: [
//           //           InkWell(
//           //             onTap: () {
//           //               NavegatorPush(context, const BookingDetailsScreen());
//           //             },
//           //             child: Icon(Icons.double_arrow_outlined,
//           //                 size: 18, color: ConstColor.kMainColor),
//           //           ),
//           //           Text(
//           //             "15 jun, 11:00 am",
//           //             style: StylesData.font12,
//           //           )
//           //         ],
//           //       ),
//           //     )
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }
