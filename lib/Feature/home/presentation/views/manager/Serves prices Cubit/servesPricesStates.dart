import 'package:shawativender/Feature/home/data/model/serves_price_details_model/serves_price_details_model.dart';

sealed class ServesPricesState {}

final class ServesPricesInitial extends ServesPricesState {}

final class ServesPricesLoading extends ServesPricesState {}

final class ServesPricesSucc extends ServesPricesState {
  final ServesPriceDetailsModel servesPrices;
  ServesPricesSucc({required this.servesPrices});
}

final class ServesPricesError extends ServesPricesState {
  final String msg;
  ServesPricesError({required this.msg});
}
