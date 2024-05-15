import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawativender/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/category.dart';
import 'package:shawativender/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/data/model/min_max_model/min_max_model.dart';
import 'package:shawativender/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawativender/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawativender/Feature/home/data/model/provider_serves_model/provider_serves_model.dart';
import 'package:shawativender/Feature/home/data/model/review_mdoel/review_mdoel.dart';
import 'package:shawativender/Feature/home/data/model/search_model/search_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProviderServesModel>> getProviderServes(
      {required int catId});
  Future<Either<Failure, String>> addService({
    required String name,
    required String nameEn,
    required String description,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required String days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required String place,
    required File image,

//     name_en
// name_ar
// place_en
// place_ar
// category_id
// floor
// bed
// bath
// price
// description_en
// description_ar
// days *[05/16/2024 3:52 PM]
// latitude
// longitude
  });

  Future<Either<Failure, BookingModel>> getRequestsUsers({required int id});
  Future<Either<Failure, String>> editService({
    required String name,
    required String nameEn,
    required String description,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required String days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required int id,
    required String placeEn,
    required String place,
    File? image,
  });

  Future<Either<Failure, HomeModel>> getHomeData({required int cateId});
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    File? image,
    required String password,
    required String confpassword,
  });

  Future<Either<Failure, BookingModel>> getBooking();
  Future<Either<Failure, SearchModel>> searchData({
    required String text,
    required String categoryId,
    required String minPrice,
    required String maxPrice,
    required String bed,
    required String floor,
    required String bath,
    required String priceDuration,
    required String minarea,
    required String maxarea,
    required double lat,
    required double long,
  });

  Future<Either<Failure, List<Category>>> getCategory();

  Future<Either<Failure, String>> addBooking({
    required int id,
    required String start,
    required String end,
  });
  Future<Either<Failure, NotificationModel>> getNotifications();

  Future<Either<Failure, FavModel>> getFavList();
  Future<Either<Failure, ReviewModel>> showReviews();
  Future<Either<Failure, String>> setLocation(
      {required double lat, required double long});

  Future<Either<Failure, String>> addSupport(
      {required String subject, required String message});

  Future<Either<Failure, String>> setBookingStatus(
      {required int id, required int status, required int customerId});

  Future<Either<Failure, MinMaxModel>> getMinMaxPrice();
}