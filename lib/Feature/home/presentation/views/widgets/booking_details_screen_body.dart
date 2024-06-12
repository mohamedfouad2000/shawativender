import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/requstes_model/datum.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/view_image_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingDetailsScreenBody extends StatefulWidget {
  const BookingDetailsScreenBody(
      {super.key, required this.model, this.fromData});
  final DatumRequests model;
  final bool? fromData;

  @override
  State<BookingDetailsScreenBody> createState() =>
      _BookingDetailsScreenBodyState();
}

class _BookingDetailsScreenBodyState extends State<BookingDetailsScreenBody> {
  int imageindex = 0;
  @override
  Widget build(BuildContext context) {
    print('opop');
    print(widget.model.lat.toString());
    print(widget.model.lng.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingProduct(
                namear: widget.model.service?.nameAr ?? '',
                placeAr: widget.model.service?.placeAr ?? '',
                features: widget.model.service?.features ?? [],
                images: widget.model.service?.gallery ?? [],
                name: widget.model.service?.name ?? '',
                place: widget.model.service?.place ?? '',
                bed: widget.model.service?.bed.toString() ?? '',
                bath: widget.model.service?.bath.toString() ?? '',
                floor: widget.model.service?.floor.toString() ?? '',
                fromReqyest: true,
                clockin: widget.model.startAt.toString(),
                clockout: widget.model.endAt.toString(),
                price: widget.model.service?.regularPrice.toString() ?? '',
                image: widget.model.service?.image ?? ''),
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
            // const Text("Payment image "),

            const SizedBox(
              height: 5,
            ),
            // if (widget.model.attachment != '' &&
            //     widget.model.attachment != null)
            //   SizedBox(
            //     height: 300,
            //     width: double.infinity,
            //     child: InkWell(
            //         onTap: () {
            //           NavegatorPush(
            //               context,
            //               ProductImageScreen(Pageindex: imageindex, imageList: [
            //                 '$xURLIMAGE${widget.model.attachment}'
            //               ]));
            //         },
            //         child: CachedImage('$xURLIMAGE${widget.model.attachment}')),
            //   ),
            // const SizedBox(
            //   height: 15,
            // ),

            SizedBox(
              height: 300,
              child: MapFlutter(
                latLng: LatLng(
                    widget.model.lat != ''
                        ? double.parse(widget.model.lat.toString())
                        : 0,
                    widget.model.lng != ''
                        ? double.parse(widget.model.lng.toString())
                        : 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            if (widget.model.attachment != '' &&
                widget.model.attachment != null)
              Text(
                S.of(context).lastPayment,
                style: StylesData.font14,
              ),
            if (widget.model.attachment != '' &&
                widget.model.attachment != null)
              const SizedBox(
                height: 10,
              ),
            if (widget.model.attachment != '' &&
                widget.model.attachment != null)
              InkWell(
                onTap: () async {
                  launchURL('$xURLIMAGE${widget.model.attachment}');
                },
                child: Container(
                  width: double.infinity,
                  // height: 70.82,
                  padding: const EdgeInsets.all(15.92),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEAECF0)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 15.5,

                        // backgroundColor: ConstColor.kMainColor,
                        backgroundImage: AssetImage(AssetsData.pdf),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(widget.model.attachment ?? '',
                          maxLines: 1, style: StylesData.font11),
                      // const SizedBox(
                      //   width: 16,
                      // ),
                      // Container(
                      //   width: 30,
                      //   height: 31,
                      //   padding: const EdgeInsets.only(
                      //     top: 9.53,
                      //     left: 8.80,
                      //     right: 9.26,
                      //     bottom: 9.53,
                      //   ),
                      //   clipBehavior: Clip.antiAlias,
                      //   decoration: ShapeDecoration(
                      //     color: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //       side: const BorderSide(
                      //           width: 1, color: Color(0xFFEAECF0)),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Center(
                      //       child: Icon(
                      //     Icons.remove_red_eye,
                      //     size: 11,
                      //   )),
                      // ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
