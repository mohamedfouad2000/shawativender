part of 'show_reviews_cubit.dart';

@immutable
sealed class ShowReviewsState {}

final class ShowReviewsInitial extends ShowReviewsState {}

final class ShowReviewsLoading extends ShowReviewsState {}

final class ShowReviewsSucc extends ShowReviewsState {
  final ReviewModel model;
  ShowReviewsSucc({required this.model});
}

final class ShowReviewsError extends ShowReviewsState {
  final String msg;
  ShowReviewsError({required this.msg});
}
