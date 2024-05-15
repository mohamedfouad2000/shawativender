import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/review_mdoel/review_mdoel.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'show_reviews_state.dart';

class ShowReviewsCubit extends Cubit<ShowReviewsState> {
  ShowReviewsCubit(this.repo) : super(ShowReviewsInitial());
  final HomeRepo repo;

  Future<void> getReviews() async {
    emit(ShowReviewsLoading());
    final result = await repo.showReviews();
    result.fold(
      (l) => emit(ShowReviewsError(msg: l.msq.toString())),
      (r) => emit(ShowReviewsSucc(model: r)),
    );
  }
}
