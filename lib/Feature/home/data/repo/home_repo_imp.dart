import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Core/remote/dio_helper.dart';
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
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, HomeModel>> getHomeData({required int cateId}) async {
    HomeModel model;
    try {
      print(
          'http://shawativender.dev.tqnia.me/api/ $xBookingEURL data is {cate :$cateId}');
      Response<dynamic> res = await DioHelper.getData(
          url: xHOMEURL, query: {if (cateId != -1) 'category_id': cateId});
      print(res.data);
      if (res.data['status'] == 201) {
        model = HomeModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    ProfileModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xPROFILEURL);
      print(res.data);
      if (res.data['status'] == 201) {
        model = ProfileModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, BookingModel>> getBooking() async {
    BookingModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xBookingEURL);

      print(res.data);
      if (res.data['status'] == 201) {
        model = BookingModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    File? image,
    required String password,
    required String confpassword,
  }) async {
    try {
      print('$name $phone $image $password $confpassword');
      Response<dynamic> res = await DioHelper.postData(
        url: xUPDATEURL,
        data: FormData.fromMap({
          'name': name,
          'phone': phone,
          if (image != null)
            'image': await MultipartFile.fromFile(image.path,
                filename: image.path.split('/').last),
          'password': password,
          'password_confirmation': confpassword,
        }),
      );
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
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
  }) async {
    SearchModel model;
    try {
      print(
          'ahaha $categoryId $minPrice $maxPrice $bed $floor $bath $text $minarea $maxarea $priceDuration $lat $long');
      Response<dynamic> res = await DioHelper.getData(url: xSEARCHURL, query: {
        if (categoryId != '-1' && categoryId != '') 'category_id': categoryId,
        if (minPrice != '') 'min_price': minPrice,
        if (maxPrice != '') 'max_price': maxPrice,
        if (bed != '') 'bed': bed,
        if (floor != '') 'floor': floor,
        if (bath != '') 'bath': bath,
        'text': text,
        if (minarea != '') 'min_area': minarea,
        if (maxarea != '') 'max_area': maxarea,
        if (priceDuration != '') 'price_duration': priceDuration,
        if (lat != 0) 'lat': lat,
        if (long != 0) 'long': long
      });
      print(res.data);
      if (res.data['status'] == 201) {
        model = SearchModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    List<Category> category = [];
    try {
      Response<dynamic> res = await DioHelper.getData(url: xCATEGORIESURL);
      print(res.data);
      if (res.data['status'] == 201) {
        for (var item in res.data['data']) {
          category.add(Category.fromJson(item));
        }
        // model = HomeModel.fromJson(res.data);
        return right(category);
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

  @override
  Future<Either<Failure, String>> addBooking(
      {required int id, required String start, required String end}) async {
    try {
      // print('$name $phone $image $password $confpassword');
      Response<dynamic> res =
          await DioHelper.postData(url: xADDBOOKINGURL, data: {}, query: {
        'service_id': id,
        'start_at': start,
        'end_at': end,
      });
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotifications() async {
    // notifications
    NotificationModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xNOTIFICATIONURL);
      print(res.data);
      if (res.data['status'] == 201) {
        // for (var item in res.data['data']) {
        //   category.add(Category.fromJson(item));
        // }
        model = NotificationModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, FavModel>> getFavList() async {
    FavModel? model = FavModel();

    try {
      Response<dynamic> res = await DioHelper.getData(url: xNOTIFICATIONURL);
      print(res.data);

      if (res.data['status'] == 201) {
        model = FavModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> addService({
    required File image,
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
  }) async {
    try {
      print(
          "data is $name $nameEn $description $descriptionEn $price $bed $bath $days $latitude $longitude $floor $categoryId $placeEn $place${image.path.split('/').last}");

      print(
          'request is $xADDSERVICEURL with data is name_ar $name nameen $nameEn description $description descriptionEn $descriptionEn price $price bed $bed bath $bath days $days latitude $latitude longitude $longitude floor $floor categoryId $categoryId placeEn $placeEn place $place image ${image.path.split('/').last}');
      Response<dynamic> res = await DioHelper.postData(
        url: xADDSERVICEURL,
        data: FormData.fromMap({
          'name_ar': name,
          'name_en': nameEn,
          'place_en': placeEn,
          "place_ar": place,
          'category_id': categoryId,
          "floor": floor,
          "bed": bed,
          "bath": bath,
          "price": price,
          "days[]": days,
          "description_en": descriptionEn,
          "description_ar": description,
          "latitude": latitude,
          "longitude": longitude,
          'image': await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        }),
      );
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewModel>> showReviews() async {
    ReviewModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xReviewService);
      print(res.data);
      if (res.data['status'] == 201) {
        model = ReviewModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> setLocation(
      {required double lat, required double long}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          data: {}, url: xSETLocation, query: {'lat': lat, 'lng': long});
      print(res.data);
      if (res.data['status'] == 201) {
        return right(res.data['msg']);
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

  @override
  Future<Either<Failure, String>> addSupport(
      {required String subject, required String message}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xSupport,
          data: {},
          query: {'subject': subject, 'message': message});
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editService(
      {required String name,
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
      File? image,
      required String place}) async {
    try {
      print('service_id $id');
      print('name $name');
      print('nameEn $nameEn');
      print('description $description');
      print('descriptionEn $descriptionEn');
      print('price $price');
      print('bed $bed');
      print('bath $bath');
      print('days $days');
      print('latitude $latitude');
      print('longitude $longitude');
      print('floor $floor');
      print('categoryId $categoryId');
      print('placeEn $placeEn');
      print('place $place');

      Response<dynamic> res = await DioHelper.postData(
        url: xUpdateSERVICEURL,
        data: FormData.fromMap({
          'service_id': id,
          'name_ar': name,
          'name_en': nameEn,
          'place_en': placeEn,
          "place_ar": place,
          'category_id': categoryId,
          "floor": floor,
          "bed": bed,
          "bath": bath,
          "price": price,
          "description_en": descriptionEn,
          "description_ar": description,
          "days[]": days,
          "latitude": latitude,
          "longitude": longitude,
          if (image!.path != '')
            'image': await MultipartFile.fromFile(image.path,
                filename: image.path.split('/').last),
        }),
      );
      print("siu is siu");
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print("error is $e");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingModel>> getRequestsUsers(
      {required int id}) async {
    BookingModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: xBookingEURL, query: {'service_id': id});

      print(res.data);
      if (res.data['status'] == 201) {
        model = BookingModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> setBookingStatus(
      {required int id, required int status, required int customerId}) async {
//

    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xSetStatusOfBooking,
          data: {},
          query: {
            'booking_id': id,
            'status': status,
            'customer_id': customerId
          });
      print("siu is siu");
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print("error is $e");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProviderServesModel>> getProviderServes(
      {required int catId}) async {
    //
    ProviderServesModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: xProviderServices, query: {
        if (catId != 0) 'category_id ': id,
      });
      print("siu is siu");
      print(res.data);
      if (res.data["status"] == 201) {
        model = ProviderServesModel.fromJson(res.data);

        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print("error is $e");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MinMaxModel>> getMinMaxPrice() async {
    MinMaxModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
        url: xGetMinMaxPrice,
        data: {},
      );
      print(res.data);
      if (res.data["status"] == 201) {
        model = MinMaxModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }
}
