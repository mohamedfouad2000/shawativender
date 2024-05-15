import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSucc extends BookingState {
  final BookingModel Model;
  BookingSucc({required this.Model});
}

final class BookingError extends BookingState {
  final String msg;
  BookingError({required this.msg});
}

final class ADDBookingLoading extends BookingState {}

final class ADDBookingSucc extends BookingState {
  final String msq;
  ADDBookingSucc({required this.msq});
}

final class ADDBookingError extends BookingState {
  final String msg;
  ADDBookingError({required this.msg});
}

final class CheckData extends BookingState {}
