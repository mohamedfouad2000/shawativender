import 'package:dartz/dartz.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Feature/register/data/models/register_model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> registerUser(
      {required String name,
      required String phone,
      required String password,
      required String fcmToken,
      required String lang,
      required String confirmPassword});
}
