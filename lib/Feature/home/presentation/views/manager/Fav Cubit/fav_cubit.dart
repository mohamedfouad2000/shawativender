import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.repo) : super(FavInitial());
  final HomeRepo repo;

  Future<void> getFavList() async {
    emit(FavLoading());
    final result = await repo.getFavList();
    result.fold((l) => emit(FavFailed(message: l.msq.toString())),
        (r) => emit(FavSuccess(model: r)));
  }
}
