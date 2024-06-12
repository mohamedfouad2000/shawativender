import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileCubitInitial());
  final HomeRepo repo;
  ProfileModel? model;
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final result = await repo.getProfile();
    result.fold(
      (l) => emit(ProfileError(msg: l.msq.toString())),
      (r) {
        model = r;
        emit(ProfileSucc(model: r));
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String password,
    File? image,
    required String confirmPassword,
  }) async {
    emit(UpdateProfileLoading());
    final result = await repo.updateProfile(
        name: name,
        phone: phone,
        image: image,
        password: password,
        confpassword: confirmPassword);
    result.fold(
      (l) => emit(UpdateProfileError(msg: l.msq.toString())),
      (r) => emit(UpdateProfileSucc(msq: r)),
    );
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    final result = await repo.deleteAccount();
    result.fold(
      (l) => emit(DeleteAccountError(msg: l.msq.toString())),
      (r) => emit(DeleteAccountSucc(msq: r)),
    );
  }
}
