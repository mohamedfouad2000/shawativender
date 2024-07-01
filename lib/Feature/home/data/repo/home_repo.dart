import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Feature/home/data/model/admin_model/admin_model.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawativender/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawativender/Feature/home/data/model/feature_model/feature_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/category.dart';
import 'package:shawativender/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/data/model/min_max_model/min_max_model.dart';
import 'package:shawativender/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawativender/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawativender/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawativender/Feature/home/data/model/provider_serves_model/provider_serves_model.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/requstes_model.dart';
import 'package:shawativender/Feature/home/data/model/with_drawil/with_drawil.dart';
import 'package:shawativender/Feature/home/data/model/review_mdoel/review_mdoel.dart';
import 'package:shawativender/Feature/home/data/model/search_model/search_model.dart';
import 'package:shawativender/Feature/home/data/model/serves_price_details_model/serves_price_details_model.dart';
import 'package:shawativender/Feature/home/data/model/seves_information/seves_information.dart';
import 'package:shawativender/Feature/home/data/model/terms_and_privacy_model/terms_and_privacy_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ServesPriceDetailsModel>> getPricesDetails(
      {required int serid,
      required String startAt,
      required String coupon,
      required int bookingId,
      required String endAt});
  Future<Either<Failure, String>> deleteAccount();
  Future<Either<Failure, FeatureModel>> getfeatures();
  Future<Either<Failure, PaymentModel>> getPaymentMethod();
  Future<Either<Failure, ServesInfo>> getserviceProductinfo(
      {required int servesId});
  Future<Either<Failure, String>> editFeatures(
      {required int serviceIdd, required int featureIds});

  Future<Either<Failure, String>> deleteFeatures(
      {required int serviceIdd, required int featureIds});
  Future<Either<Failure, String>> editEventDays(
      {required int serviceId, required String day, required String price});
  Future<Either<Failure, String>> deleteEventDays(
      {required int serviceId, required int eventId});

  // Future<Either<Failure, FeatureModel>> getfeatures();

  Future<Either<Failure, ProviderServesModel>> getProviderServes({
    required int catId,
    required int index,
  });
  Future<Either<Failure, String>> addService({
    required String name,
    required String nameEn,
    required String description,
    required List range_days,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required List days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required String placeEn,
    required String place,
    required File image,
    required List<int> features,
    required List eventDays,
    required List eventprices,
    List<XFile>? files = const [],

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

//   service_id
// feature_id
//

  Future<Either<Failure, String>> changeLang({required String lang});
  Future<Either<Failure, RequstesModel>> getRequestsUsers(
      {required int id, required int status});
  Future<Either<Failure, String>> editService({
    required String name,
    required String nameEn,
    required List range_days,
    required String description,
    required String descriptionEn,
    required String price,
    required String bed,
    required String bath,
    required List days,
    required String latitude,
    required String longitude,
    required String floor,
    required String categoryId,
    required int id,
    required String placeEn,
    required String place,
    File? image,
  });
  Future<Either<Failure, bool>> checkPhone({required String phone});
  Future<Either<Failure, int>> getblance();

  Future<Either<Failure, String>> setPassword(
      {required String newpassord,
      required String confirmnewpassord,
      required String phone});
  Future<Either<Failure, WithDrawilModel>> getwithdrawlRequests(
      {required int catId});
  Future<Either<Failure, String>> addwithdraw({
    required String amount,
    required String password,
    required String account_number,
    required String payment_method_id,
  });

  Future<Either<Failure, HomeModel>> getHomeData({required int cateId});
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    File? image,
    required String currentPassword,
    required String password,
    required String confpassword,
  });

  Future<Either<Failure, String>> updateImageProfile({
    required File image,
  });

  // Future<Either<Failure, BookingModel>> getBooking();
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
    required int accept,
  });

  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, TermsAndPrivacyModel>> getTermsAndPrivacy();

  Future<Either<Failure, String>> addBooking({
    required int id,
    required String start,
    required String end,
  });
  Future<Either<Failure, NotificationModel>> getNotifications();
  Future<Either<Failure, int>> getNotificationsCount();

  Future<Either<Failure, FavModel>> getFavList();
  Future<Either<Failure, ReviewModel>> showReviews();
  Future<Either<Failure, String>> setLocation(
      {required double lat, required double long});

  Future<Either<Failure, String>> addSupport(
      {required String subject, required String message});
  Future<Either<Failure, AdminModel>> addSupportDataMobileAndEmail();

  Future<Either<Failure, String>> setBookingStatus(
      {required int id, required int status, required int customerId});

  Future<Either<Failure, MinMaxModel>> getMinMaxPrice();
  Future<Either<Failure, String>> addgallery({
    required List<XFile> galleries,
    required int serviceId,
  });
  Future<Either<Failure, String>> deletegallery(
      {required int gallerieId, required int serviceId});
}
