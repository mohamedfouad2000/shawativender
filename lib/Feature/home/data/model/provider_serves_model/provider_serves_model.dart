import 'package:shawativender/Feature/home/data/model/home_model/service.dart';

class ProviderServesModel {
  List<Service>? data;
  String? msg;
  int? status;

  ProviderServesModel({this.data, this.msg, this.status});

  factory ProviderServesModel.fromJson(Map<String, dynamic> json) {
    return ProviderServesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'msg': msg,
        'status': status,
      };
}
