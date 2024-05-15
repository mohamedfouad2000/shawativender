import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'add_servce_state.dart';

class AddServceCubit extends Cubit<AddServceState> {
  AddServceCubit(this.repo) : super(AddServceInitial());
  final HomeRepo repo;
  Future<void> Addservice({
    required String name,
    required String nameEn,
    required String description,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required String days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required String place,
    required File image,
  }) async {
    emit(AddServceLoading());
    final result = await repo.addService(
        name: name,
        nameEn: nameEn,
        description: description,
        descriptionEn: descriptionEn,
        price: price,
        bed: bed,
        bath: bath,
        days: days,
        latitude: latitude,
        longitude: longitude,
        floor: floor,
        categoryId: categoryId,
        placeEn: placeEn,
        place: place,
        image: image);
    result.fold(
      (l) => emit(AddServceError(msg: l.msq.toString())),
      (r) => emit(AddServceSucc(msq: r)),
    );
  }

  Future<void> Editservice({
    required String name,
    required String nameEn,
    required int id,
    required String description,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required String days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required String place,
    required File image,
  }) async {
    emit(AddServceLoading());
    final result = await repo.editService(
        id: id,
        name: name,
        nameEn: nameEn,
        description: description,
        descriptionEn: descriptionEn,
        price: price,
        bed: bed,
        bath: bath,
        days: days,
        latitude: latitude,
        longitude: longitude,
        floor: floor,
        categoryId: categoryId,
        placeEn: placeEn,
        place: place,
        image: image);
    result.fold(
      (l) => emit(AddServceError(msg: l.msq.toString())),
      (r) => emit(AddServceSucc(msq: r)),
    );
  }
}
