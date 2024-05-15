import 'package:shawativender/Feature/home/data/model/home_model/category.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';

import 'user.dart';

class Review {
  int? id;
  int? userId;
  int? providerId;
  int? serviceId;
  int? brandId;
  String? rating;
  String? review;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Service? service;
  Category? category;

  Review({
    this.id,
    this.userId,
    this.providerId,
    this.serviceId,
    this.brandId,
    this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.service,
    this.category,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        providerId: json['provider_id'] as int?,
        serviceId: json['service_id'] as int?,
        brandId: json['brand_id'] as int?,
        rating: json['rating'] as String?,
        review: json['review'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'provider_id': providerId,
        'service_id': serviceId,
        'brand_id': brandId,
        'rating': rating,
        'review': review,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
        'service': service?.toJson(),
        'category': category?.toJson(),
      };
}
