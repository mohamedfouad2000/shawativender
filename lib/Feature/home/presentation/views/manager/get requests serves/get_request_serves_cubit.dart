import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'get_request_serves_state.dart';

class GetRequestServesCubit extends Cubit<GetRequestServesState> {
  GetRequestServesCubit(this.reoo) : super(GetRequestServesInitial());

  final HomeRepo reoo;

  Future<void> getRequests({required int id}) async {
    emit(GetRequestServesLoading());

    final result = await reoo.getRequestsUsers(id: id);
    result.fold((l) {
      emit(GetRequestServesError(l.msq));
    }, (r) {
      emit(GetRequestServesSucc(r));
    });
  }

  Future<void> setBookingStatus(
      {required int id, required int status, required int customerId}) async {
    emit(setRequestServesLoading());
    final result = await reoo.setBookingStatus(
        id: id, status: status, customerId: customerId);
    result.fold((l) {
      emit(setRequestServesError(l.msq));
    }, (r) {
      emit(setRequestServesSucc(r));
    });
  }
}
