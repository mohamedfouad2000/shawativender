import 'user.dart';

class Datum {
  int? id;
  int? userId;
  int? amount;
  int? status;
  String? accountNumber;
  int? paymentMethodId;
  dynamic adminAttachment;
  dynamic adminId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Datum({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.accountNumber,
    this.paymentMethodId,
    this.adminAttachment,
    this.adminId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        amount: json['amount'] as int?,
        status: json['status'] as int?,
        accountNumber: json['account_number'] as String?,
        paymentMethodId: json['payment_method_id'] as int?,
        adminAttachment: json['admin_attachment'] as dynamic,
        adminId: json['admin_id'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'amount': amount,
        'status': status,
        'account_number': accountNumber,
        'payment_method_id': paymentMethodId,
        'admin_attachment': adminAttachment,
        'admin_id': adminId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}
