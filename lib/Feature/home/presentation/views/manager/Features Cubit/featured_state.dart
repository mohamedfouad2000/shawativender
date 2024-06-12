part of 'featured_cubit.dart';

@immutable
sealed class FeaturedState {}

final class FeaturedInitial extends FeaturedState {}

class FeaturedLoading extends FeaturedState {}

class changeValueState extends FeaturedState {}

class addOrRemoveSucc extends FeaturedState {}

class addOrRemoveLoading extends FeaturedState {}

class FeaturedSuccess extends FeaturedState {
  final FeatureModel model;
  FeaturedSuccess({required this.model});
}

class FeaturedError extends FeaturedState {
  final String error;
  FeaturedError({required this.error});
}

class getservProLoading extends FeaturedState {}

class getservProSuccess extends FeaturedState {
  final ServesInfo model;
  getservProSuccess({required this.model});
}

class getservProError extends FeaturedState {
  final String error;
  getservProError({required this.error});
}

class addEventDayLoading extends FeaturedState {}

class addEventDaySuccess extends FeaturedState {
  final String txt;
  addEventDaySuccess({required this.txt});
}

class addEventDayError extends FeaturedState {
  final String error;
  addEventDayError({required this.error});
}
