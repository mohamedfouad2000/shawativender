import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/pay_now_screen.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_add_image.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/google_map.dart';

class AddServiceForm extends StatefulWidget {
  const AddServiceForm({super.key});

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final _formKey = GlobalKey<FormState>();
  var Propertynamecontroller = TextEditingController();
  var Categorycontroller = TextEditingController();
  var Areacontroller = TextEditingController();
  var Forrentcontroller = TextEditingController();
  var Dailycontroller = TextEditingController();
  var Pricecontroller = TextEditingController();
  var Bedroomscontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var Bathroomscontroller = TextEditingController();
  var Floorcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customTextFiled(
              controller: Propertynamecontroller,
              hintText: 'Property Name',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image11,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customTextFiled(
              controller: Categorycontroller,
              hintText: 'Category',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image22,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customDropDownList(
              list: [],
              hintText: 'For rent',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image33,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customTextFiled(
              controller: Areacontroller,
              hintText: 'Area',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image44,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customTextFiled(
              controller: Pricecontroller,
              hintText: 'Price',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image55,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customDropDownList(
              list: [],
              hintText: 'Daily',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image66,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customDropDownList(
              list: [],
              hintText: 'Bed rooms',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image77,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customDropDownList(
              list: [],
              hintText: 'Bath rooms',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image77,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          customDropDownList(
              list: [],
              hintText: 'Floor',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    AssetsData.image77,
                  ),
                  height: 10,
                  width: 10,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              customTextFiled(
                controller: descriptioncontroller,
                hintText: 'Description',
                maxLines: 6,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(
                      AssetsData.image88,
                    ),
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomAddImage(),
          const SizedBox(
            height: 15,
          ),
          const CalendarDetails(),
          const SizedBox(
            height: 15,
          ),
          const GoogleMapWidget(),
          const SizedBox(
            height: 15,
          ),
          defaultButton(
              fun: () {
                NavegatorPush(context, const PayNowScreen());
              },
              textWidget: Text(
                'Add Service',
                style: StylesData.font13,
              ),
              height: 54,
              c: ConstColor.kMainColor),
        ],
      ),
    );
  }
}
