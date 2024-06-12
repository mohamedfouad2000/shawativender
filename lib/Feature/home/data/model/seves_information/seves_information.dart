import 'data.dart';

class ServesInfo {
  Data? data;
  String? msg;
  int? status;

  ServesInfo({this.data, this.msg, this.status});

  factory ServesInfo.fromJson(Map<String, dynamic> json) {
    return ServesInfo(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'msg': msg,
        'status': status,
      };
}
