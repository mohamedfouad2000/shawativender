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
      required String password,
      required String confirmPassword}) async {
    RegisterModel? model;
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xREGISTERURL, data: {}, query: {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
        'role': 2
      });
      print(res.data);
      if (res.data['status'] == 201) {
        model = RegisterModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
