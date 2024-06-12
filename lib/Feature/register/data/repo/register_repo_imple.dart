import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Core/remote/dio_helper.dart';
import 'package:shawativender/Feature/register/data/models/register_model/register_model.dart';
import 'package:shawativender/Feature/register/data/repo/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, RegisterModel>> registerUser(
      {required String name,
      required String phone,
      required String fcmToken,
      required String lang,
      required String password,
      required String confirmPassword}) async {
    RegisterModel? model;
    try {
      String error = '';

      Response<dynamic> res =
          await DioHelper.postData(url: xREGISTERURL, data: {}, query: {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
        'role': 2,
        'fcm_token': fcmToken,
        'lang': lang,
      });
      // print(res.data);

      model = RegisterModel.fromJson(res.data);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        print('Error fetching data: $e');
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
