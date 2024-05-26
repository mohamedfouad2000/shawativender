import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/edit_service_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/map_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingDetailsServes extends StatelessWidget {
  const BookingDetailsServes({
    super.key,
    required this.model,
  });
  final Service model;

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
                name: model.name ?? '',
                place: model.place ?? '',
                bed: model.bed.toString() ?? '',
                bath: model.bath.toString() ?? '',
                floor: model.floor.toString() ?? '',
                clockin: model.days
                        ?.split(',')
                        .first
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
                clockout: model.days
                        ?.split(',')
                        .last
                        .replaceAll('[', '')
                        .replaceAll('"', '')
                        .replaceAll(']', '')
                        .replaceAll(' ', ' ')
                        .replaceAll("\\", "")
                        .trim() ??
                    '',
                price: model.price.toString() ?? '',
                image: model.image ?? ''),
            const SizedBox(
              height: 15,
            ),
            // const BookingPaymentMethod(),
            const SizedBox(
              height: 15,
            ),

            CalendarDetails(
              fromdate: model.days ?? '',
              todate: model.days ?? '',
            ),

            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                print("object");
                NavegatorPush(
                    context,
                    MapScreen(
                        latLng: LatLng(
                            model.lat != ''
                                ? double.parse(model.lat.toString())
                                : 0,
                            model.lng != ''
                                ? double.parse(model.lng.toString())
                                : 0)));
              },
              child: SizedBox(
                height: 300,
                child: MapFlutter(
                  latLng: LatLng(
                      model.lat != '' ? double.parse(model.lat.toString()) : 0,
                      model.lng != '' ? double.parse(model.lng.toString()) : 0),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // if(model.userId ==)
            InkWell(
              onTap: () {
                NavegatorPush(context, EditServiceScreen(model: model));
              },
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xffD0DAF0),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Center(
                  child: Text(
                    S.of(context).edit_service,
                    style: StylesData.font17
                        .copyWith(color: ConstColor.kMainColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
