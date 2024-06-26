import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/servies_product_item_info.dart';

class ServiesProductItem extends StatelessWidget {
  const ServiesProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,

            offset: const Offset(
              0,
              0,
            ), // changes x,y position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(AssetsData.testimage2),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                right: 18,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ConstColor.kMainColor,
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          "Closed",
                          style:
                              StylesData.font12.copyWith(color: Colors.white),
                        ),
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ServiceProductItemInfo(),
        ],
      ),
    );
  }
}
