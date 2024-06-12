import 'customer.dart';
import 'service.dart';

class Datum {
  int? id;
  int? serviceId;
  int? categoryId;
  dynamic couponId;
  int? amount;
  int? insurance;
  int? totalAmount;
  int? taxes;
  int? vat;
  int? customerId;
  int? providerId;
  int? bookingStatusId;
  String? startAt;
  String? endAt;
  int? paymentStatusId;
  int? paymentMethodId;
  String? attachment;
  dynamic description;
  String? lng;
  String? lat;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;
  Customer? customer;

  Datum({
    this.id,
    this.serviceId,
    this.categoryId,
    this.couponId,
    this.amount,
    this.insurance,
    this.totalAmount,
    this.taxes,
    this.vat,
    this.customerId,
    this.providerId,
    this.bookingStatusId,
    this.startAt,
    this.endAt,
    this.paymentStatusId,
    this.paymentMethodId,
    this.attachment,
    this.description,
    this.lng,
    this.lat,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.customer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        serviceId: json['service_id'] as int?,
        categoryId: json['category_id'] as int?,
        couponId: json['coupon_id'] as dynamic,
        amount: json['amount'] as int?,
        insurance: json['insurance'] as int?,
        totalAmount: json['total_amount'] as int?,
        taxes: json['taxes'] as int?,
        vat: json['vat'] as int?,
        customerId: json['customer_id'] as int?,
        providerId: json['provider_id'] as int?,
        bookingStatusId: json['booking_status_id'] as int?,
        startAt: json['start_at'] as String?,
        endAt: json['end_at'] as String?,
        paymentStatusId: json['payment_status_id'] as int?,
        paymentMethodId: json['payment_method_id'] as int?,
        attachment: json['attachment'] as String?,
        description: json['description'] as dynamic,
        lng: json['lng'] as String?,
        lat: json['lat'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_id': serviceId,
        'category_id': categoryId,
        'coupon_id': couponId,
        'amount': amount,
        'insurance': insurance,
        'total_amount': totalAmount,
        'taxes': taxes,
        'vat': vat,
        'customer_id': customerId,
        'provider_id': providerId,
        'booking_status_id': bookingStatusId,
        'start_at': startAt,
        'end_at': endAt,
        'payment_status_id': paymentStatusId,
        'payment_method_id': paymentMethodId,
        'attachment': attachment,
        'description': description,
        'lng': lng,
        'lat': lat,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'service': service?.toJson(),
        'customer': customer?.toJson(),
      };
}
