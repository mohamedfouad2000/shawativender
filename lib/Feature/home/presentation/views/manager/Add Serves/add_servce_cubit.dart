import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
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
    required List days,
    required List<int> features,
    required List eventDays,
    required List eventprices,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required String place,
    required File image,
    required List range_days,
    List<XFile>? files = const [],
  }) async {
    emit(AddServceLoading());
    final result = await repo.addService(
        name: name,
        range_days: range_days,
        eventDays: eventDays,
        eventprices: eventprices,
        features: features,
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
        files: files,
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
    required List days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required List range_days,
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
        range_days: range_days,
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
