import 'package:bloc/bloc.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.repo) : super(BookingInitial());
  final HomeRepo repo;

  DateTime? checkin;
  DateTime? checkout;
  void changecheckin(DateTime ch) {
    checkin = ch;
    emit(CheckData());
  }

  void changecheckout(DateTime ch) {
    checkout = ch;
    emit(CheckData());
  }

  Future<void> getBookingData() async {
    emit(BookingLoading());
    final result = await repo.getBooking();
    result.fold(
      (l) => emit(BookingError(msg: l.msq.toString())),
      (r) => emit(BookingSucc(Model: r)),
    );
  }

  Future<void> addBooking({
    required int id,
    required String start,
    required String end,
  }) async {
    emit(ADDBookingLoading());
    final result = await repo.addBooking(id: id, start: start, end: end);
    result.fold(
      (l) => emit(ADDBookingError(msg: l.msq.toString())),
      (r) => emit(ADDBookingSucc(msq: r)),
    );
  }
}
