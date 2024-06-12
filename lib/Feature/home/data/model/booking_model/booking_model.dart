import 'datum.dart';

class BookingModel {
  List<Datum>? data;
  String? msg;
  int? status;

  BookingModel({this.data, this.msg, this.status});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        msg: json['msg'] as String?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'msg': msg,
        'status': status,
      };
}
