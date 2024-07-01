import 'package:shawativender/Feature/home/data/model/search_model/event_day.dart';
import 'package:shawativender/Feature/home/data/model/search_model/feature.dart';

import 'gallery.dart';

class Service {
  int? id;
  String? name;
  String? nameAr;
  int? categoryId;
  int? userId;
  int? floor;
  int? bed;
  int? bath;
  int? price;
  String? description;
  String? descriptionAr;
  String? days;
  String? rangeDays;
  String? lat;
  String? lng;
  int? available;
  int? accept;
  String? regularPrice;
  int? priceWithCommission;
  String? image;
  int? isFavorited;
  int? bookingCount;
  DateTime? createdAt;
  String? place;
  String? placeAr;
  List<EventDay>? eventDays;
  List<Feature>? features;
  List<Gallery>? gallery;
  String? distance;

  Service(
      {this.id,
      this.name,
      this.nameAr,
      this.categoryId,
      this.userId,
      this.floor,
      this.bed,
      this.bath,
      this.price,
      this.description,
      this.descriptionAr,
      this.days,
      this.lat,
      this.lng,
      this.available,
      this.accept,
      this.priceWithCommission,
      this.image,
      this.isFavorited,
      this.bookingCount,
      this.createdAt,
      this.place,
      this.placeAr,
      this.eventDays,
      this.features,
      this.gallery,
      this.rangeDays,
      this.distance,
      this.regularPrice});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameAr: json['name_ar'] as String?,
        categoryId: json['category_id'] as int?,
        regularPrice: json['regular_price'] as String?,
        rangeDays: json['range_days'] as String?,
        userId: json['user_id'] as int?,
        floor: json['floor'] as int?,
        bed: json['bed'] as int?,
        bath: json['bath'] as int?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        descriptionAr: json['description_ar'] as String?,
        days: json['days'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        available: json['available'] as int?,
        accept: json['accept'] as int?,
        priceWithCommission: json['price_with_commission'] as int?,
        image: json['image'] as String?,
        isFavorited: json['is_favorited'] as int?,
        bookingCount: json['booking_count'] as int?,
        distance: json['distance'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        place: json['place'] as String?,
        placeAr: json['place_ar'] as String?,
        eventDays: (json['eventDays'] as List<dynamic>?)
            ?.map((e) => EventDay.fromJson(e as Map<String, dynamic>))
            .toList(),
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
            .toList(),
        gallery: (json['gallery'] as List<dynamic>?)
            ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_ar': nameAr,
        'category_id': categoryId,
        'user_id': userId,
        'floor': floor,
        'bed': bed,
        'bath': bath,
        'distance': distance,
        'price': price,
        'regular_price': regularPrice,
        'range_days': rangeDays,
        'description': description,
        'description_ar': descriptionAr,
        'days': days,
        'lat': lat,
        'lng': lng,
        'available': available,
        'accept': accept,
        'price_with_commission': priceWithCommission,
        'image': image,
        'is_favorited': isFavorited,
        'booking_count': bookingCount,
        'created_at': createdAt?.toIso8601String(),
        'place': place,
        'place_ar': placeAr,
        'eventDays': eventDays,
        'features': features,
        'gallery': gallery?.map((e) => e.toJson()).toList(),
      };
}
