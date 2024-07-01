import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit(this.repo) : super(SetPasswordInitial());
  final HomeRepo repo;

  void setPassword(
      {required String newpassord,
      required String confirmnewpassord,
      required String phone}) async {
    emit(setPasswordLoading());
    final result = await repo.setPassword(
        newpassord: newpassord,
        confirmnewpassord: confirmnewpassord,
        phone: phone);
    result.fold(
      (l) => emit(setPasswordError(msg: l.msq.toString())),
      (r) {
        emit(setPasswordSucc(msg: r));
      },
    );
  }

  void checkPhone({required String phone}) async {
    emit(CheckPhoneLoading());

    final result = await repo.checkPhone(phone: phone);
    result.fold(
      (l) => emit(CheckPhoneError(msg: l.msq.toString())),
      (r) {
        emit(CheckPhoneSucc(check: r));
      },
    );
  }
}
