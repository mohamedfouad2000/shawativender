import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:shawativender/Feature/login/data/repo/login_repo.dart';
import 'package:shawativender/Feature/login/presentation/manager/Login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepo repo;

  Future<void> loginUser(
      {required String phone,
      required String password,
      required String fcmToken}) async {
    emit(LoginLoading());
    final result = await repo.loginUser(
        lang: Get.locale?.languageCode == 'ar' ? 'ar' : 'en',
        phone: phone,
        password: password,
        fcmToken: fcmToken);
    print("object");
    print('$phone is $password');
    result.fold((l) => emit(LoginFailed(l.msq.toString())),
        (r) => emit(LoginSuccess(r)));
  }
}
