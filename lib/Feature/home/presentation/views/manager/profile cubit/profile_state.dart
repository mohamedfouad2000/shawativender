import 'package:shawativender/Feature/home/data/model/profile_model/profile_model.dart';

sealed class ProfileState {}

final class ProfileCubitInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSucc extends ProfileState {
  final ProfileModel model;
  ProfileSucc({required this.model});
}

final class ProfileError extends ProfileState {
  final String msg;
  ProfileError({required this.msg});
}

final class UpdateProfileLoading extends ProfileState {}

final class UpdateProfileSucc extends ProfileState {
  final String msq;
  UpdateProfileSucc({required this.msq});
}

final class UpdateProfileError extends ProfileState {
  final String msg;
  UpdateProfileError({required this.msg});
}
