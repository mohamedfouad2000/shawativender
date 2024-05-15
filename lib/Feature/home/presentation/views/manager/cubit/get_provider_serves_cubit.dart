import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/provider_serves_model/provider_serves_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'get_provider_serves_state.dart';

class GetProviderServesCubit extends Cubit<GetProviderServesState> {
  GetProviderServesCubit(this.repo) : super(GetProviderServesInitial());
  final HomeRepo repo;
  Future<void> getProviderServes({required int catId}) async {
    emit(GetProviderServesLoading());
    final result = await repo.getProviderServes(catId: catId);
    result.fold((l) => emit(GetProviderServesError(msg: l.msq.toString())),
        (r) => emit(GetProviderServesSuccess(data: r)));
  }
}
