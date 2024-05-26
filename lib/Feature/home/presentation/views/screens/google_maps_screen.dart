import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/map_widget.dart';

class FlutterMapsScreen extends StatelessWidget {
  const FlutterMapsScreen({super.key, required this.latLng});
  final LatLng latLng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: MapFlutter(latLng: latLng),
    );
  }
}
