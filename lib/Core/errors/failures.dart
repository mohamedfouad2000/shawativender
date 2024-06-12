import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';

class Failure {
  String msq;
  Failure({required this.msq});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msq, this.msg});
  String? msg;
  factory ServerFailure.fromDioError(DioException dio) {
    switch (dio.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(msq: 'Connection Timeout With ApiServers');
      case DioExceptionType.sendTimeout:
        return ServerFailure(msq: 'Send Timeout With ApiServers');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(msq: 'Receive Timeout With ApiServers');

      case DioExceptionType.badCertificate:
        return ServerFailure(msq: 'bad Certificate With ApiServers');

      case DioExceptionType.badResponse:
        return ServerFailure.fromRespo(
            dio.response!.statusCode!, dio.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(msq: 'opps There Was An Error try Again Later !');

      case DioExceptionType.connectionError:
        return ServerFailure(msq: 'opps There Was An Error try Again Later ');

      case DioExceptionType.unknown:
        if (dio.message!.contains("SocketException")) {
          return ServerFailure(msq: 'No Internet Connection');
        } else {
          return ServerFailure(
              msq: 'opps There Was An Error try Again Later !');
        }
      default:
        return ServerFailure(msq: 'opps There Was An Error try Again Later !');
    }
  }
  factory ServerFailure.fromRespo(int statusCode, dynamic respo) {
    print("object from Error");
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(msq: respo['msg'].toString());
    } else if (statusCode == 404) {
      return ServerFailure(msq: 'Your Request Not Found , Try Later !');
    } else if (statusCode == 500) {
      return ServerFailure(msq: 'Internet Server Error , Try Later !');
    } else {
      return ServerFailure(msq: 'opps There Was An Error try Again Later !');
    }
  }
}
