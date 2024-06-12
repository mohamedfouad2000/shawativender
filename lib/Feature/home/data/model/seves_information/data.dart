import 'package:shawativender/Feature/home/data/model/home_model/gallery.dart';
import 'package:shawativender/Feature/home/data/model/search_model/event_day.dart';
import 'package:shawativender/Feature/home/data/model/search_model/feature.dart';

class Data {
  List<EventDay>? eventDays;
  List<Feature>? features;
  List<Gallery>? gallery;

  Data({this.eventDays, this.features, this.gallery});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        eventDays: (json['eventDays'] as List<dynamic>?)
            ?.map((e) => EventDay.fromJson(e as Map<String, dynamic>))
            .toList(),
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
            .toList(),
        gallery: (json['gallery'] as List<dynamic>?)
            ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'eventDays': eventDays?.map((e) => e.toJson()).toList(),
        'features': features?.map((e) => e.toJson()).toList(),
        'gallery': gallery,
      };
}
