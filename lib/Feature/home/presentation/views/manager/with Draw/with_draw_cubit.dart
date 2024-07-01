import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/with_drawil/with_drawil.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'with_draw_state.dart';

class WithDrawCubit extends Cubit<WithDrawState> {
  WithDrawCubit(this.repo) : super(WithDrawInitial());
  final HomeRepo repo;
  Future<void> getWithDrawRequests({required int catId}) async {
    emit(GetAllrequestsLoading());
    final result = await repo.getwithdrawlRequests(catId: catId);
    result.fold(
      (l) => emit(GetAllrequestsError(msg: l.msq.toString())),
      (r) => emit(GetAllrequestsSucc(model: r)),
    );
  }

  Future<void> getWithDrawBalance() async {
    emit(GetBalanceLoading());
    final result = await repo.getblance();
    result.fold(
      (l) => emit(GetBalanceError(msg: l.msq.toString())),
      (r) => emit(GetBalanceSucc(balance: r)),
    );
  }

  Future<void> addWithDraw({
    required String amount,
    required String password,
    required String account_number,
    required String payment_method_id,
  }) async {
    emit(AddWithDrawLoading());
    final result = await repo.addwithdraw(
        amount: amount,
        password: password,
        account_number: account_number,
        payment_method_id: payment_method_id);
    result.fold(
      (l) => emit(AddWithDrawError(msg: l.msq.toString())),
      (r) => emit(AddWithDrawSucc(msg: r)),
    );
  }
}
