import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/home/data/model/booking_model/rental.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/map_widget.dart';

class BookingDetailsScreenBody extends StatelessWidget {
  const BookingDetailsScreenBody(
      {super.key, required this.model, this.fromData});
  final Rental model;
  final bool? fromData;

  @override
  Widget build(BuildContext context) {
    print('opop');
    print(model.lat.toString());
    print(model.lng.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingProduct(
                name: model.service?.name ?? '',
                place: model.service?.place ?? '',
                bed: model.service?.bed.toString() ?? '',
                bath: model.service?.bath.toString() ?? '',
                floor: model.service?.floor.toString() ?? '',
                clockin: model.startAt.toString(),
                clockout: model.endAt.toString(),
                price: model.service?.price.toString() ?? '',
                image: model.service?.image ?? ''),
            const SizedBox(
              height: 15,
            ),
            // const BookingPaymentMethod(),
            const SizedBox(
              height: 15,
            ),

            // if (fromData == null)
            //   CalendarDetails(
            //     fromdate: model.service?.days ?? '',
            //     todate: model.service?.days ?? '',
            //   ),
            const Text("Payment image "),

            const SizedBox(
              height: 5,
            ),

            SizedBox(
              height: 300,
              width: double.infinity,
              child: CachedImage('$xURLIMAGE${model.attachment}'),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 300,
              child: MapFlutter(
                latLng: LatLng(
                    model.lat != '' ? double.parse(model.lat.toString()) : 0,
                    model.lng != '' ? double.parse(model.lng.toString()) : 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
