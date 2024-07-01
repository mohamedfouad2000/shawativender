class Service {
  int? id;
  int? userId;
  int? categoryId;
  String? image;
  String? place;
  String? placeAr;
  String? name;
  String? nameAr;
  int? price;
  String? regularPrice;
  int? discount;
  int? bed;
  int? bath;
  int? floor;
  int? priceWithCommission;
  String? lng;
  String? lat;
  String? description;
  String? descriptionAr;
  int? commissionPercentage;
  int? commissionMoney;
  int? commissionId;
  int? available;
  int? accept;
  int? rate;
  String? days;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? distance;

  Service({
    this.id,
    this.distance,
    this.userId,
    this.categoryId,
    this.image,
    this.place,
    this.placeAr,
    this.name,
    this.nameAr,
    this.price,
    this.regularPrice,
    this.discount,
    this.bed,
    this.bath,
    this.floor,
    this.priceWithCommission,
    this.lng,
    this.lat,
    this.description,
    this.descriptionAr,
    this.commissionPercentage,
    this.commissionMoney,
    this.commissionId,
    this.available,
    this.accept,
    this.rate,
    this.days,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as int?,
        distance: json['distance'] as String?,
        userId: json['user_id'] as int?,
        categoryId: json['category_id'] as int?,
        image: json['image'] as String?,
        place: json['place'] as String?,
        placeAr: json['place_ar'] as String?,
        name: json['name'] as String?,
        nameAr: json['name_ar'] as String?,
        price: json['price'] as int?,
        regularPrice: json['regular_price'] as String?,
        discount: json['discount'] as int?,
        bed: json['bed'] as int?,
        bath: json['bath'] as int?,
        floor: json['floor'] as int?,
        priceWithCommission: json['price_with_commission'] as int?,
        lng: json['lng'] as String?,
        lat: json['lat'] as String?,
        description: json['description'] as String?,
        descriptionAr: json['description_ar'] as String?,
        commissionPercentage: json['commission_percentage'] as int?,
        commissionMoney: json['commission_money'] as int?,
        commissionId: json['commission_id'] as int?,
        available: json['available'] as int?,
        accept: json['accept'] as int?,
        rate: json['rate'] as int?,
        days: json['days'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'distance': distance,
        'user_id': userId,
        'category_id': categoryId,
        'image': image,
        'place': place,
        'place_ar': placeAr,
        'name': name,
        'name_ar': nameAr,
        'price': price,
        'regular_price': regularPrice,
        'discount': discount,
        'bed': bed,
        'bath': bath,
        'floor': floor,
        'price_with_commission': priceWithCommission,
        'lng': lng,
        'lat': lat,
        'description': description,
        'description_ar': descriptionAr,
        'commission_percentage': commissionPercentage,
        'commission_money': commissionMoney,
        'commission_id': commissionId,
        'available': available,
        'accept': accept,
        'rate': rate,
        'days': days,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
