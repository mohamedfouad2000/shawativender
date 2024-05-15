import 'data.dart';

class ReviewModel {
  Data? data;
  String? msg;
  int? status;

  ReviewModel({this.data, this.msg, this.status});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        msg: json['msg'] as String?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'msg': msg,
        'status': status,
      };
}
