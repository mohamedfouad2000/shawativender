part of 'get_provider_serves_cubit.dart';

@immutable
sealed class GetProviderServesState {}

final class GetProviderServesInitial extends GetProviderServesState {}

final class GetProviderServesLoading extends GetProviderServesState {}

final class GetProviderServesSuccess extends GetProviderServesState {
  final ProviderServesModel data;
  GetProviderServesSuccess({required this.data});
}

final class GetProviderServesError extends GetProviderServesState {
  final String msg;
  GetProviderServesError({required this.msg});
}
