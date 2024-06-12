import 'package:shawativender/Feature/home/data/model/feature_model/feature_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/category.dart';

sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategoryLoading extends GetCategoryState {}

final class GetCategorySucc extends GetCategoryState {
  final List<Category> list;
  GetCategorySucc({required this.list});
}

final class GetCategoryError extends GetCategoryState {
  final String msg;
  GetCategoryError({required this.msg});
}

// class FeaturedLoading extends GetCategoryState {}

// class FeaturedSuccess extends GetCategoryState {
//   final FeatureModel model;
//   FeaturedSuccess({required this.model});
// }

// class FeaturedError extends GetCategoryState {
//   final String error;
//   FeaturedError({required this.error});
// }
