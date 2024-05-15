part of 'support_cubit.dart';

@immutable
sealed class SupportState {}

final class SupportInitial extends SupportState {}

final class SupportLoading extends SupportState {}

final class SupportSucc extends SupportState {
  final String msq;
  SupportSucc({required this.msq});
}

final class SupportError extends SupportState {
  final String msg;
  SupportError({required this.msg});
}
