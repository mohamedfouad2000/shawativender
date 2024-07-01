part of 'with_draw_cubit.dart';

@immutable
sealed class WithDrawState {}

final class WithDrawInitial extends WithDrawState {}

final class GetAllrequestsLoading extends WithDrawState {}

final class GetAllrequestsSucc extends WithDrawState {
  final WithDrawilModel model;
  GetAllrequestsSucc({required this.model});
}

final class GetAllrequestsError extends WithDrawState {
  final String msg;
  GetAllrequestsError({required this.msg});
}

final class GetBalanceLoading extends WithDrawState {}

final class GetBalanceSucc extends WithDrawState {
  final int balance;
  GetBalanceSucc({required this.balance});
}

final class GetBalanceError extends WithDrawState {
  final String msg;
  GetBalanceError({required this.msg});
}

final class AddWithDrawLoading extends WithDrawState {}

final class AddWithDrawSucc extends WithDrawState {
  final String msg;
  AddWithDrawSucc({required this.msg});
}

final class AddWithDrawError extends WithDrawState {
  final String msg;
  AddWithDrawError({required this.msg});
}
