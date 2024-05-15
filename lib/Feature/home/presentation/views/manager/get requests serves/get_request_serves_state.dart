part of 'get_request_serves_cubit.dart';

@immutable
sealed class GetRequestServesState {}

final class GetRequestServesInitial extends GetRequestServesState {}

final class GetRequestServesLoading extends GetRequestServesState {}

final class GetRequestServesError extends GetRequestServesState {
  final String error;
  GetRequestServesError(this.error);
}

final class GetRequestServesSucc extends GetRequestServesState {
  final BookingModel data;
  GetRequestServesSucc(this.data);
}

final class setRequestServesLoading extends GetRequestServesState {}

final class setRequestServesError extends GetRequestServesState {
  final String error;
  setRequestServesError(this.error);
}

final class setRequestServesSucc extends GetRequestServesState {
  final String msq;
  setRequestServesSucc(this.msq);
}
