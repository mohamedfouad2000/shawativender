import 'package:bloc/bloc.dart';
import 'package:shawativender/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final HomeRepo repo;
  HomeModel? model;

  Future<void> getHomeData({required int cateId}) async {
    emit(HomeLoading());
    final result = await repo.getHomeData(cateId: cateId);
    result.fold(
      (l) => emit(HomeError(msg: l.msq.toString())),
      (r) {
        model = r;
        emit(HomeSucc(model: r));
      },
    );
  }
}
