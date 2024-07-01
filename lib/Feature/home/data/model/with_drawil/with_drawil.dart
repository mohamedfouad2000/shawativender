import 'datum.dart';

class WithDrawilModel {
  List<Datum>? data;
  String? msg;
  int? status;

  WithDrawilModel({this.data, this.msg, this.status});

  factory WithDrawilModel.fromJson(Map<String, dynamic> json) =>
      WithDrawilModel(
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
