import 'package:dartz/dartz.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Feature/register/data/models/register_model/register_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, RegisterModel>> loginUser(
      {required String phone, required String password});
}
