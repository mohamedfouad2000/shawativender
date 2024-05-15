import 'review.dart';

class Data {
  double? rating;
  List<Review>? reviews;

  Data({this.rating, this.reviews});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rating: (json['rating'] as num?)?.toDouble(),
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}
