part of 'add_servce_cubit.dart';

@immutable
sealed class AddServceState {}

final class AddServceInitial extends AddServceState {}

final class AddServceLoading extends AddServceState {}

final class AddServceSucc extends AddServceState {
  final String msq;
  AddServceSucc({required this.msq});
}

final class AddServceError extends AddServceState {
  final String msg;
  AddServceError({required this.msg});
}
