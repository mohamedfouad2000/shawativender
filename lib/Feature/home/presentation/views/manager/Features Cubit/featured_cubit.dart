import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shawativender/Feature/home/data/model/feature_model/feature_model.dart';
import 'package:shawativender/Feature/home/data/model/seves_information/seves_information.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  String? value;
  FeaturedCubit(this.repo) : super(FeaturedInitial());
  static FeaturedCubit get(context) => BlocProvider.of(context);
  final HomeRepo repo;
  FeatureModel? model;
  ServesInfo? sercesInfo;
  Map<int, String> features = {};

  Future<void> getFeaturesData() async {
    emit(FeaturedLoading());
    final result = await repo.getfeatures();
    result.fold((l) => emit(FeaturedError(error: l.msq)), (r) {
      model = r;
      emit(FeaturedSuccess(model: r));
    });
  }

  void changeValue({required String value}) {
    this.value = value;
    emit(changeValueState());
  }

  void addFeatureToList({required int id}) {
    emit(addOrRemoveLoading());
    model!.data?.forEach((element) {
      if (value == element.featureName) {
        // valuetxt = element.id.toString();
      }
    });
    features[id] = value!;

    print(value);
    print('features.length is ${features.length}');
    emit(addOrRemoveSucc());
  }

  void removeFeatureFromList({required int id}) {
    emit(addOrRemoveLoading());
    print("object");

    print(features[id]);
    features.remove(features.keys.toList()[id]);
    emit(addOrRemoveSucc());
  }

  Future<void> getServesInfo({required int servesId}) async {
    emit(getservProLoading());
    final result = await repo.getserviceProductinfo(servesId: servesId);
    result.fold((l) => emit(getservProError(error: l.msq)), (r) {
      sercesInfo = r;
      emit(getservProSuccess(model: r));
    });
  }

  Future<void> addeventday({
    required int servesId,
    required String day,
    required String price,
  }) async {
    emit(addEventDayLoading());
    final result =
        await repo.editEventDays(serviceId: servesId, day: day, price: price);
    result.fold((l) => emit(addEventDayError(error: l.msq)), (r) {
      emit(addEventDaySuccess(txt: r));
    });
  }

  Future<void> deleteeventday({
    required int servesId,
    required int eventId,
  }) async {
    emit(addEventDayLoading());
    final result =
        await repo.deleteEventDays(serviceId: servesId, eventId: eventId);
    result.fold((l) {
      emit(addEventDayError(error: l.msq));
      getServesInfo(servesId: servesId);
    }, (r) {
      emit(addEventDaySuccess(txt: r));
      getServesInfo(servesId: servesId);
    });
  }

  Future<void> addFeature({
    required int serviceIdd,
    required int featureIds,
  }) async {
    emit(addEventDayLoading());
    final result =
        await repo.editFeatures(serviceIdd: serviceIdd, featureIds: featureIds);
    result.fold((l) => emit(addEventDayError(error: l.msq)), (r) {
      emit(addEventDaySuccess(txt: r));
    });
  }

  Future<void> deleteFeture({
    required int serviceIdd,
    required int featureIds,
  }) async {
    emit(addEventDayLoading());
    final result = await repo.deleteFeatures(
        serviceIdd: serviceIdd, featureIds: featureIds);
    result.fold((l) => emit(addEventDayError(error: l.msq)), (r) {
      emit(addEventDaySuccess(txt: r));
    });
  }

  Future<void> addGallary(
      {required List<XFile> galleries, required int serviceId}) async {
    emit(addEventDayLoading());
    final result =
        await repo.addgallery(galleries: galleries, serviceId: serviceId);
    result.fold(
      (l) => emit(addEventDayError(error: l.msq.toString())),
      (r) => emit(addEventDaySuccess(txt: r)),
    );
    getServesInfo(servesId: serviceId);
  }

  Future<void> deleteGallary(
      {required int gallerieId, required int serviceId}) async {
    emit(addEventDayLoading());
    final result =
        await repo.deletegallery(gallerieId: gallerieId, serviceId: serviceId);
    result.fold(
      (l) => emit(addEventDayError(error: l.msq.toString())),
      (r) => emit(addEventDaySuccess(txt: r)),
    );
    getServesInfo(servesId: serviceId);
  }
}
