import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';

import 'package:shawativender/Feature/home/data/model/payment_model/payment_model.dart';

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

final class CheckData extends BookingState {}

final class GetPaymentError extends BookingState {
  final String msg;
  GetPaymentError({required this.msg});
}

final class GetPaymentLoading extends BookingState {}

final class GetPaymentSucc extends BookingState {
  final PaymentModel model;
  GetPaymentSucc({required this.model});
}

final class AddAttachMentLoading extends BookingState {}

final class AddAttachMentSucc extends BookingState {
  final String txt;
  AddAttachMentSucc({required this.txt});
}

final class AddAttachMentError extends BookingState {
  final String msg;
  AddAttachMentError({required this.msg});
}

final class CancelBookingLoading extends BookingState {}

final class CancelBookingSucc extends BookingState {
  final String txt;
  CancelBookingSucc({required this.txt});
}

final class CancelBookingError extends BookingState {
  final String msg;
  CancelBookingError({required this.msg});
}
