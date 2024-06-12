import 'datum.dart';

class FeatureModel {
  List<FeturedDatum>? data;
  String? msg;
  int? status;

  FeatureModel({this.data, this.msg, this.status});

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => FeturedDatum.fromJson(e as Map<String, dynamic>))
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
