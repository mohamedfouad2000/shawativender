import 'datum.dart';

class RequstesModel {
  List<DatumRequests>? data;
  String? msg;
  int? status;

  RequstesModel({this.data, this.msg, this.status});

  factory RequstesModel.fromJson(Map<String, dynamic> json) => RequstesModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DatumRequests.fromJson(e as Map<String, dynamic>))
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
