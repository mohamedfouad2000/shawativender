import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/constans/const.dart';

import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/gallery.dart';
import 'package:shawativender/Feature/home/data/model/search_model/feature.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/view_image_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/clock_in_out_with_time.dart';
import 'package:shawativender/generated/l10n.dart';

class BookingProduct extends StatefulWidget {
  const BookingProduct(
      {super.key,
      required this.name,
      required this.place,
      required this.bed,
      required this.bath,
      required this.floor,
      required this.clockin,
      required this.clockout,
      required this.images,
      required this.image,
      required this.price,
      required this.features,
      required this.namear,
      required this.placeAr,
      this.fromReqyest});
  final String name;
  final String namear;
  final String image;
  final String placeAr;

  final String place;
  final String bed;
  final String bath;
  final String floor;
  final String clockin;
  final String clockout;
  final String price;
  final List<Gallery> images;
  final List<Feature> features;
  final bool? fromReqyest;

  @override
  State<BookingProduct> createState() => _BookingProductState();
}

class _BookingProductState extends State<BookingProduct> {
  String currentImage = '';
  Set<String> i = {};
  List<String> images = [];
  int imageindex = 0;
  @override
  void initState() {
    print('aha is ya ahha${widget.fromReqyest}');
    // TODO: implement initState
    super.initState();
    currentImage = '$xURLIMAGE${widget.image}';
    images = List.generate(widget.images.length, (index) {
      return '$xURLIMAGE${widget.images[index].path}';
    });
    images.add('$xURLIMAGE${widget.image}');
    i = images.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // image: const DecorationImage(
            //     image: AssetImage(AssetsData.testimage2), fit: BoxFit.cover)
          ),
          child: InkWell(
              onTap: () {
                print('i is A set of $i');
                NavegatorPush(
                    context,
                    // ['$xURLIMAGE$image']
                    ProductImageScreen(
                      imageList: i.toSet().toList(),
                      Pageindex: imageindex,
                    ));
              },
              child: CachedImage(currentImage)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          // width: 60,
          child: ListView.separated(
            itemCount: i.toList().length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    imageindex = index;
                    currentImage = i.toList()[index] ??
                        '$xURLIMAGE${widget.images.first.path!}';
                  });
                },
                child: CachedImage(
                  width: 60,
                  i.toList()[index],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          LocalizationCubit.get(context).isArabic()
              ? widget.namear
              : widget.name,
          style: StylesData.font24Google,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              LocalizationCubit.get(context).isArabic()
                  ? widget.placeAr
                  : widget.place,
              style: StylesData.font12.copyWith(color: Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        widget.fromReqyest != null
            ? const SizedBox()
            : Container(
                // width: 150,
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade300)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage(
                          AssetsData.image3,
                        ),
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        " ${widget.bed}",
                        style: StylesData.font14,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const ImageIcon(
                        AssetImage(
                          AssetsData.image2,
                        ),
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        " ${widget.bath}",
                        style: StylesData.font14,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const ImageIcon(
                        AssetImage(
                          AssetsData.image1,
                        ),
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        " ${widget.floor}",
                        style: StylesData.font14,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                CachedImage(
                                    '$xURLIMAGE${widget.features[index].image}',
                                    height: 14,
                                    width: 14),

                                // ImageIcon(
                                //   NetworkImage(
                                //       '$xURLIMAGE${widget.features[index].image}'),
                                //   color: Colors.grey,
                                //   size: 14,
                                // ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  widget.features[index].featureName !=
                                              'null' &&
                                          widget.features[index].featureName !=
                                              null
                                      ? (LocalizationCubit.get(context)
                                              .isArabic()
                                          ? " ${widget.features[index].featureNameAr}"
                                          : " ${widget.features[index].featureName}")
                                      : '',
                                  style: StylesData.font14,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          itemCount: widget.features.length ?? 0)
                    ],
                  ),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        ClockInOutWithTime(
          clockin: widget.clockin,
          clockout: widget.clockout,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              LocalizationCubit.get(context).isArabic()
                  ? " ${widget.price} ${S.of(context).SAR}  "
                  : "${S.of(context).SAR} ${widget.price} ",
              style: StylesData.font18.copyWith(color: ConstColor.kMainColor),
            ),
            Expanded(
              child: Text(
                "/${S.of(context).day}",
                style: StylesData.font16
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
