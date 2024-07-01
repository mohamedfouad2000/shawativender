import 'package:bloc/bloc.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Serves%20prices%20Cubit/servesPricesStates.dart';

class ServesPricesCubit extends Cubit<ServesPricesState> {
  ServesPricesCubit(this.repo) : super(ServesPricesInitial());
  final HomeRepo repo;
  Future<void> getServesPrices({
    required int serid,
    required String startAt,
    required String endAt,
    required String coupon,
    required int bookingId,
  }) async {
    emit(ServesPricesLoading());
    final result = await repo.getPricesDetails(
        serid: serid,
        startAt: startAt,
        endAt: endAt,
        coupon: coupon,
        bookingId: bookingId);
    result.fold(
      (l) => emit(ServesPricesError(msg: l.msq.toString())),
      (r) {
        emit(ServesPricesSucc(servesPrices: r));
      },
    );
  }
}
