part of 'set_password_cubit.dart';

@immutable
sealed class SetPasswordState {}

final class SetPasswordInitial extends SetPasswordState {}

final class setPasswordLoading extends SetPasswordState {}

final class setPasswordError extends SetPasswordState {
  final String msg;

  setPasswordError({required this.msg});
}

final class setPasswordSucc extends SetPasswordState {
  final String msg;

  setPasswordSucc({required this.msg});
}

final class CheckPhoneLoading extends SetPasswordState {}

final class CheckPhoneError extends SetPasswordState {
  final String msg;

  CheckPhoneError({required this.msg});
}

final class CheckPhoneSucc extends SetPasswordState {
  final bool check;

  CheckPhoneSucc({required this.check});
}
