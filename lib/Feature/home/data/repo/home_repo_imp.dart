import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/errors/failures.dart';
import 'package:shawativender/Core/remote/dio_helper.dart';
import 'package:shawativender/Feature/home/data/model/admin_model/admin_model.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawativender/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawativender/Feature/home/data/model/feature_model/feature_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/category.dart';
import 'package:shawativender/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawativender/Feature/home/data/model/with_drawil/with_drawil.dart';
import 'package:shawativender/Feature/home/data/model/min_max_model/min_max_model.dart';
import 'package:shawativender/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawativender/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawativender/Feature/home/data/model/provider_serves_model/provider_serves_model.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/requstes_model.dart';
import 'package:shawativender/Feature/home/data/model/review_mdoel/review_mdoel.dart';
import 'package:shawativender/Feature/home/data/model/search_model/search_model.dart';
import 'package:shawativender/Feature/home/data/model/serves_price_details_model/serves_price_details_model.dart';
import 'package:shawativender/Feature/home/data/model/seves_information/seves_information.dart';
import 'package:shawativender/Feature/home/data/model/terms_and_privacy_model/terms_and_privacy_model.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/servies_product_item.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, HomeModel>> getHomeData({required int cateId}) async {
    HomeModel model;
    try {
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

  // @override
  // Future<Either<Failure, BookingModel>> getBooking() async {
  //   BookingModel model;
  //   try {
  //     Response<dynamic> res = await DioHelper.getData(url: xBookingEURL);

  //     print(res.data);
  //     if (res.data['status'] == 201) {
  //       model = BookingModel.fromJson(res.data);
  //       return right(model);
  //     } else {
  //       return left(ServerFailure(msq: res.data['msg'].toString()));
  //     }
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }

  //     return left(ServerFailure(msq: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    required String currentPassword,
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
          if (password != '') 'password': password,
          if (confpassword != '') 'password_confirmation': confpassword,
          if (currentPassword != '') 'current_password': currentPassword
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
    required int accept,
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
        if (long != 0) 'long': long,
        if (accept != -1) 'accept': accept
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
    required List<int> features,
    required List eventDays,
    required List eventprices,
    required List range_days,
    required File image,
    required String name,
    required String nameEn,
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
    required String placeEn,
    required String place,
    List<XFile>? files = const [],
  }) async {
    try {
      print('data time is the $range_days');
      print(
          "data is ya biz$eventDays $eventprices $features $name $nameEn $description $descriptionEn $price $bed $bath $days $latitude $longitude $floor $categoryId $placeEn $place${image.path.split('/').last}");
      print('x is $eventDays $features $eventprices');
      print(
          'request is $xADDSERVICEURL with data is name_ar $name nameen $nameEn description $description descriptionEn $descriptionEn price $price bed $bed bath $bath days $days latitude $latitude longitude $longitude floor $floor categoryId $categoryId placeEn $placeEn place $place image ${image.path.split('/').last}');

      FormData formData = FormData();

      formData = FormData.fromMap({
        'name_ar': name,
        'range_days': '$range_days',
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
        'event_days[]': eventDays,
        'features[]': features,
        'event_prices[]': eventprices
      });
      if (files!.isNotEmpty) {
        for (int i = 0; i < files.length; i++) {
          String filePath = files[i].path;
          String fileName = filePath.split('/').last;

          formData.files.add(MapEntry(
            'galleries[$i]',
            MultipartFile(
              File(filePath).readAsBytes().asStream(),
              await File(filePath).length(),
              filename: fileName,
              // contentType: MediaType('application', 'octet-stream'),
            ),
          ));
        }
      }

      Response<dynamic> res = await DioHelper.postData(
        url: xADDSERVICEURL,
        data: formData,
      );
      // print('${res.data}res.data');
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print('error is $e');
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
          'range_days': '$range_days',
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
  Future<Either<Failure, RequstesModel>> getRequestsUsers(
      {required int id, required int status}) async {
    RequstesModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: xBookingEURL,
          query: {
            if (id != -1) 'service_id': id,
            if (status != -1) 'booking_status_id': status
          });

      print(res.data);
      if (res.data['status'] == 201) {
        model = RequstesModel.fromJson(res.data);
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
      Response<dynamic> res =
          await DioHelper.postData(url: xSetStatusOfBooking, data: {}, query: {
        'booking_id': id,
        'status': status,
        // 'customer_id': customerId
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
  Future<Either<Failure, ProviderServesModel>> getProviderServes({
    required int catId,
    required int index,
  }) async {
    //
    ProviderServesModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: xProviderServices, query: {
        // if (catId != 0) 'category_id ': id,
        if (index != 2) 'accept': index
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

  @override
  Future<Either<Failure, FeatureModel>> getfeatures() async {
    FeatureModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
        url: xGetfeatures,
        data: {},
      );
      print(res.data);
      if (res.data["status"] == 201) {
        model = FeatureModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> editEventDays(
      {required int serviceId,
      required String day,
      required String price}) async {
    //
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xAddEventDay,
          data: {},
          query: {'service_id': serviceId, 'day': day, 'price': price});
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
  Future<Either<Failure, String>> editFeatures(
      {required int serviceIdd, required int featureIds}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xaddFeature, data: {}, query: {
        'service_id': serviceIdd,
        'feature_id': featureIds,
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
  Future<Either<Failure, String>> deleteEventDays(
      {required int serviceId, required int eventId}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xdeleteEventDay,
          data: {},
          query: {'service_id': serviceId, 'event_id': eventId});
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
  Future<Either<Failure, String>> deleteFeatures(
      {required int serviceIdd, required int featureIds}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xdeleteFeature, data: {}, query: {
        'service_id': serviceIdd,
        'feature_id': featureIds,
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
  Future<Either<Failure, ServesInfo>> getserviceProductinfo(
      {required int servesId}) async {
    ServesInfo model;
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: 'get-service-information',
          data: {},
          query: {
            'service_id': servesId,
          });
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        model = ServesInfo.fromJson(res.data);
        return right(model);
        // return right(res.data["msg"]);
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
  Future<Either<Failure, String>> addgallery(
      {required List<XFile> galleries, required int serviceId}) async {
    try {
      FormData formData = FormData();

      formData = FormData.fromMap({
        'service_id': serviceId,
      });
      if (galleries.isNotEmpty) {
        for (int i = 0; i < galleries.length; i++) {
          String filePath = galleries[i].path;
          String fileName = filePath.split('/').last;

          formData.files.add(MapEntry(
            'galleries[$i]',
            MultipartFile(
              File(filePath).readAsBytes().asStream(),
              await File(filePath).length(),
              filename: fileName,
              // contentType: MediaType('application', 'octet-stream'),
            ),
          ));
        }
      }
      Response<dynamic> res = await DioHelper.postData(
        url: xaddgallery,
        data: formData,
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
  Future<Either<Failure, String>> deletegallery(
      {required int gallerieId, required int serviceId}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xdeletegallery, data: {}, query: {
        'service_id': serviceId,
        'gallery_id': gallerieId,
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
  Future<Either<Failure, String>> deleteAccount() async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xDeleteAccount, data: {}, query: {});
      print(res.data);
      if (res.data["status"] == 201) {
        print('');
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
  Future<Either<Failure, AdminModel>> addSupportDataMobileAndEmail() async {
    AdminModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: 'settings', data: {}, query: {});
      print(res.data);
      if (res.data["status"] == 201) {
        model = AdminModel.fromJson(res.data);
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
  Future<Either<Failure, String>> changeLang({required String lang}) async {
    try {
      //  /https://shawate2.com/api/change-user-language
      Response<dynamic> res = await DioHelper.postData(
          url: 'change-user-language', data: {}, query: {'lang': lang});
      print(res.data);
      if (res.data["status"] == 201) {
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
  Future<Either<Failure, int>> getNotificationsCount() async {
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: 'notifications-count', data: {}, query: {});
      print(res.data);
      if (res.data["status"] == 201) {
        return right(res.data['data']);
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
    //
  }

  @override
  Future<Either<Failure, TermsAndPrivacyModel>> getTermsAndPrivacy() async {
    TermsAndPrivacyModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: 'terms-policy', data: {}, query: {});
      print(res.data);
      if (res.data["status"] == 201) {
        model = TermsAndPrivacyModel.fromJson(res.data);
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
  Future<Either<Failure, ServesPriceDetailsModel>> getPricesDetails(
      {required int serid,
      required String startAt,
      required String coupon,
      required int bookingId,
      required String endAt}) async {
    ServesPriceDetailsModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: 'get-prices-details', data: {}, query: {
        'service_id': serid,
        'start_at': startAt,
        'end_at': endAt,
        if (bookingId != -1) 'booking_id': bookingId,
        if (coupon != '') 'coupon_code': coupon
      });
      print("aha");
      print(res.data);
      if (res.data["status"] == 201) {
        model = ServesPriceDetailsModel.fromJson(res.data);
        return right(model);
      } else if (res.data["status"] == 200) {
        model = ServesPriceDetailsModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> updateImageProfile(
      {required File image}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
        url: xUPDATEURL,
        data: FormData.fromMap({
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
  Future<Either<Failure, String>> addwithdraw(
      {required String amount,
      required String password,
      required String account_number,
      required String payment_method_id}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: 'sent-withdrawal', data: {}, query: {
        'amount': amount,
        'password': password,
        'account_number': account_number,
        'payment_method_id': payment_method_id
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
  Future<Either<Failure, int>> getblance() async {
    // TODO: implement getblance
    //wallet
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: 'wallet', data: {}, query: {});
      print("aha");
      print(res.data);
      if (res.data["status"] == 201) {
        return right(res.data['data']['blance']);
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
  Future<Either<Failure, PaymentModel>> getPaymentMethod() async {
    PaymentModel model;
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: 'payment-methods', data: {}, query: {});
      print(res.data);
      if (res.data['status'] == 201) {
        // for (var item in res.data['data']) {
        //   category.add(Category.fromJson(item));
        // }
        model = PaymentModel.fromJson(res.data);
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
  Future<Either<Failure, bool>> checkPhone({required String phone}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: 'check-phone',
          data: {},
          query: {'phone': phone.replaceAll('+', '').toString()});
      print(res.data);
      if (res.data["status"] == 201) {
        return right(res.data["data"] as bool);
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
  Future<Either<Failure, WithDrawilModel>> getwithdrawlRequests(
      {required int catId}) async {
    WithDrawilModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: 'withdrawal',
          data: {},
          query: {if (catId != -1) 'status': catId});
      print("aha");
      print(res.data);
      if (res.data["status"] == 201) {
        model = WithDrawilModel.fromJson(res.data);
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

  @override
  Future<Either<Failure, String>> setPassword(
      {required String newpassord,
      required String confirmnewpassord,
      required String phone}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: 'reset-password', data: {}, query: {
        'new_password': newpassord,
        'confrim_password': confirmnewpassord,
        'phone': phone.replaceAll('+', ''),
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
}
