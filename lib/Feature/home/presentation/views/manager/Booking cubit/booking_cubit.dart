import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.repo) : super(BookingInitial());
  static BookingCubit get(context) => BlocProvider.of(context);
  final HomeRepo repo;
  PaymentModel? model;
  String? account;
  DateTime? checkin;
  DateTime? checkout;
  TextEditingController coupon = TextEditingController();
  List<DateTime> timesCalender = [];

  Future<void> getPaymentMethod() async {
    emit(GetPaymentLoading());
    final result = await repo.getPaymentMethod();
    result.fold(
      (l) => emit(GetPaymentError(msg: l.msq.toString())),
      (r) {
        model = r;
        emit(GetPaymentSucc(model: r));
      },
    );
  }
}
