import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchInitial());
  final HomeRepo repo;
  static SearchCubit get(context) => BlocProvider.of(context);

  String? text;
  int? categoryId;
  double? minPrice;
  double? maxPrice;
  int? bed;
  int? floor;
  int? bath;
  int? priceDuration;
  String? minarea;
  String? maxarea;
  // SearchModel? model;
  double? lat;
  double? long;
  int? accept;
  void setallempty() {
    text = '';
    categoryId = -1;
    minPrice = null;
    maxPrice = null;
    bed = null;
    floor = null;
    bath = null;
    priceDuration = null;
    minarea = null;
    maxarea = null;
    lat = null;
    long = null;
    accept = null;

// category_id: 15, min_price: 164.76022011893136, max_price: 711.3932451520647, bed: 3, floor: 2,
//  bath: 2, text: , min_area: , max_area: , price_duration: weekly, lat: 0.0, long: 0.0
  }

  Future<void> searchData({
    required String text,
    required String categoryId,
    required String minPrice,
    required String maxPrice,
    required String bed,
    required String floor,
    required String bath,
    required String priceDuration,
    required String minarea,
    required String maxarea,
    required double lat,
    required double long,
    required int accept,
  }) async {
    emit(SearchDataLoading());
    final result = await repo.searchData(
        text: text,
        categoryId: categoryId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        bed: bed,
        floor: floor,
        lat: lat,
        long: long,
        bath: bath,
        priceDuration: priceDuration,
        minarea: minarea,
        maxarea: maxarea,
        accept: accept);
    result.fold(
      (l) => emit(SearchDataError(msg: l.msq.toString())),
      (r) {
        // model = r;
        emit(SearchDataSucc(model: r));
      },
    );
  }
}
