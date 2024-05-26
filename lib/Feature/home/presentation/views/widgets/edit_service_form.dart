import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/model/home_model/service.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Add%20Serves/add_servce_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_add_image.dart';
import 'package:shawativender/generated/l10n.dart';

class EditServiceForm extends StatefulWidget {
  const EditServiceForm({super.key, required this.model});
  final Service model;

  @override
  State<EditServiceForm> createState() => _EditServiceFormState();
}

class _EditServiceFormState extends State<EditServiceForm> {
  List<DateTime?> Times = [];
  var Propertynamecontroller = TextEditingController();
  var PropertynameArabiccontroller = TextEditingController();
  var descriptionArabiccontroller = TextEditingController();
  var Categorycontroller = TextEditingController();
  var placecontroller = TextEditingController();
  var placeArbiccontroller = TextEditingController();
  var Forrentcontroller = TextEditingController();
  var Dailycontroller = TextEditingController();
  var Pricecontroller = TextEditingController();
  var Bedroomscontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var Bathroomscontroller = TextEditingController();
  var Floorcontroller = TextEditingController();
  String error = '';
  String bed = '';
  String bath = '';
  String floor = '';
  String category = '';
  double latetude = 0.0;
  double longitude = 0.0;
  String address = '';
  Set<String> days = {};
  File? file;
  ImagePicker picker = ImagePicker();
  var formKey = GlobalKey<FormState>();
  //[05/16/2024 3:52 PM]

  Future<void> getuserprofile({required ImageSource i}) async {
    // emit(getuserprofileLoading());
    var pickedfile = await picker.pickImage(source: i);
    if (pickedfile != null) {
      setState(() {
        file = File(pickedfile.path);
      });
      print(pickedfile.path);
    } else {
      print("No Image");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    File mack = File('');
    print("siu is siu ${mack.path}");

    String days = widget.model.days!
        .replaceAll('[', '')
        .replaceAll('"', '')
        .replaceAll(']', '')
        .replaceAll('\\', '')
        .trim();
    print('day is $days');
    for (int i = 0; i < days.split(',').length; i++) {
      try {
        print('$i is  ${days.split(',')[i]}');
        var x = DateFormat.yMd('en_US')
            .parseLoose(days.split(',')[i].trim().substring(0, 10));
        // setState(() {
        Times.add(x);

        String formattedDate = DateFormat('MM/dd/yyyy', 'en').format(x);

        print(formattedDate);

        this.days.add(formattedDate);

        setState(() {});
        // });

        print('Times.length ${Times.length}');
      } catch (e) {
        print(e);
      }
    }

    Propertynamecontroller.text = widget.model.name ?? '';
    PropertynameArabiccontroller.text = widget.model.nameAr ?? '';
    descriptionArabiccontroller.text = widget.model.descriptionAr ?? '';
    placecontroller.text = widget.model.place ?? '';
    placeArbiccontroller.text = widget.model.placeAr ?? '';
    Dailycontroller.text = widget.model.available.toString() ?? '';
    Pricecontroller.text = widget.model.price.toString();
    descriptioncontroller.text = widget.model.description.toString();

    bed = widget.model.bed.toString();
    bath = widget.model.bath.toString();
    floor = widget.model.floor.toString();
    category = widget.model.categoryId.toString();
    print(' aha${widget.model.lat.toString()}');
    latetude = double.parse(widget.model.lat.toString());
    print(' aha$latetude');

    longitude = double.parse(widget.model.lng.toString());
    address = '';
    // Set> days = {};
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCategoryCubit(HomeRepoImpl())..getCategory(),
        ),
        BlocProvider(
          create: (context) => AddServceCubit(HomeRepoImpl()),
        ),
      ],
      child: BlocConsumer<AddServceCubit, AddServceState>(
        listener: (context, state) {
          if (state is AddServceSucc) {
            showToast(msq: state.msq);
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is AddServceError) {
            showToast(msq: state.msg);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    customTextFormedFiled(
                        controller: Propertynamecontroller,
                        hintText: 'Property Name',
                        preicon: const Padding(
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
                    customTextFormedFiled(
                        controller: PropertynameArabiccontroller,
                        hintText: 'Property Name With Arabic',
                        preicon: const Padding(
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
                    BlocConsumer<GetCategoryCubit, GetCategoryState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is GetCategorySucc) {
                          return customDropDownList(
                              item: category,
                              onChanged: (p0) {
                                print(p0);
                                category = p0.toString();
                              },
                              itemAsString: (String u) {
                                String x = '';
                                for (var element in state.list) {
                                  if (u == element.id.toString()) {
                                    x = element.brandName!;
                                  }
                                }
                                print(x);
                                return x.toString();
                              },
                              list: [
                                ...List.generate(state.list.length,
                                    (index) => state.list[index].id.toString()),
                              ],
                              hintText: 'Category',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage(
                                    AssetsData.image33,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                              ));
                        } else if (state is GetCategoryError) {
                          return const Text('Error');
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormedFiled(
                        controller: placecontroller,
                        hintText: 'Place',
                        preicon: const Padding(
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
                    customTextFormedFiled(
                        controller: placeArbiccontroller,
                        hintText: 'Place With Arabic',
                        preicon: const Padding(
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
                    customTextFormedFiled(
                        controller: Pricecontroller,
                        hintText: 'Price',
                        preicon: const Padding(
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
                    // customDropDownList(
                    //     list: [],
                    //     hintText: 'Daily',
                    //     preicon: const Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Image(
                    //         image: AssetImage(
                    //           AssetsData.image66,
                    //         ),
                    //         height: 10,
                    //         width: 10,
                    //       ),
                    //     )),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    customDropDownList(
                        item: bed,
                        onChanged: (p0) {
                          bed = p0.toString();
                        },
                        list: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "7",
                          "8",
                          "9",
                          "10",
                          "11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                        ],
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
                        item: bath,
                        onChanged: (p0) {
                          bath = p0.toString();
                        },
                        list: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "7",
                          "8",
                          "9",
                          "10",
                          "11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                        ],
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
                        item: floor,
                        onChanged: (p0) {
                          floor = p0.toString();
                        },
                        list: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "7",
                          "8",
                          "9",
                          "10",
                          "11",
                          "12",
                          "13",
                          "14",
                          "15",
                          "16",
                          "17",
                          "18",
                          "19",
                          "20",
                          "21",
                          "22",
                        ],
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
                        customTextFormedFiled(
                          controller: descriptioncontroller,
                          hintText: 'Description',
                          maxLines: 6,
                          preicon: Icon(
                            Icons.add,
                            color: ConstColor.kMainColor,
                            size: 0.0,
                          ),
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
                    Stack(
                      children: [
                        customTextFormedFiled(
                          preicon: Icon(
                            Icons.add,
                            color: ConstColor.kMainColor,
                            size: 0.0,
                          ),
                          controller: descriptionArabiccontroller,
                          hintText: 'Description Arabic',
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
                    InkWell(
                      onTap: () {
                        var x = AlertDialog(
                          surfaceTintColor: Colors.white,
                          title: Text(
                            S.of(context).ChooseYourPhoto,
                          ),
                          content: SizedBox(
                            height: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: TextButton.icon(
                                        label: Text(
                                          S.of(context).Gallary,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onPressed: () async {
                                          getuserprofile(
                                              i: ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.storage_outlined,
                                          color: Colors.black,
                                        ))),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: TextButton.icon(
                                        label: Text(
                                          S.of(context).camera,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        onPressed: () {
                                          getuserprofile(i: ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.black,
                                        ))),
                              ],
                            ),
                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return x;
                            });
                      },
                      child: file == null
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    height: 130,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: CachedImage(
                                        '$xURLIMAGE${widget.model.image}')),
                                Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: ConstColor.kMainColor,
                                      borderRadius: BorderRadius.circular(12),
                                      // border: Border.all(color: Colors.white, width: .8),
                                    ),
                                    child: const Image(
                                      image: AssetImage(AssetsData.upload),
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            )
                          : Container(
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.file(file!),
                            ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    CalendarDatePicker2(
                      onValueChanged: (value) {
                        Times = value;
                        for (var element in value) {
                          String formattedDate =
                              DateFormat('MM/dd/yyyy', 'en').format(element!);

                          print(formattedDate);

                          days.add(formattedDate);
                        }
                      },
                      config: CalendarDatePicker2Config(
                          // enabled: false,
                          disableModePicker: false,
                          rangeBidirectional: false,
                          calendarType: CalendarDatePicker2Type.multi,
                          centerAlignModePicker: true),

                      value: Times,
                      // onValueChanged: (dates) => _dates = dates,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (latetude == 0 && longitude == 0)
                      defaultButton(
                          fun: () async {
                            ShowModeSheet(context);
                          },
                          textWidget: Text(
                            S.of(context).SetLocation,
                            style:
                                StylesData.font13.copyWith(color: Colors.black),
                          ),
                          height: 54,
                          c: Colors.white),
                    if (latetude == 0 && longitude == 0)
                      const SizedBox(
                        height: 10,
                      ),
                    // if (latetude != 0 && longitude != 0)
                    // Center(child: Text("The Place is // $address")),
                    const SizedBox(
                      height: 15,
                    ),
                    if (latetude != 0 && longitude != 0)
                      defaultButton(
                          fun: () async {
                            ShowModeSheet(context);
                          },
                          textWidget: Text(
                            S.of(context).changeLocation,
                            style:
                                StylesData.font13.copyWith(color: Colors.black),
                          ),
                          height: 54,
                          c: Colors.white),

                    // const GoogleMapWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    if (error != '')
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                            child: Text(
                          error,
                          style:
                              StylesData.font14.copyWith(color: Colors.white),
                        )),
                      ),
                    if (error != '')
                      const SizedBox(
                        height: 20,
                      ),
                    defaultButton(
                        fun: () {
                          print(
                              'data is ${PropertynameArabiccontroller.text} and ${Propertynamecontroller.text} and ${descriptionArabiccontroller.text} and ${descriptioncontroller.text} and ${Pricecontroller.text} $bed $bath $days $latetude $longitude $floor $category ${placecontroller.text} ${placeArbiccontroller.text} ${file?.path} ');
                          if (formKey.currentState!.validate()) {
                            if (category == '' ||
                                bath == '' ||
                                bed == '' ||
                                floor == '' ||
                                latetude == 0 ||
                                longitude == 0 ||
                                days.isEmpty) {
                              setState(() {
                                error = S.of(context).error_Msq_add_service;
                              });
                            } else {
                              print("place is ${Propertynamecontroller.text}");

                              BlocProvider.of<AddServceCubit>(context)
                                  .Editservice(
                                      id: int.parse(widget.model.id.toString()),
                                      name: PropertynameArabiccontroller.text,
                                      nameEn: Propertynamecontroller.text,
                                      description:
                                          descriptionArabiccontroller.text,
                                      descriptionEn: descriptioncontroller.text,
                                      price: Pricecontroller.text,
                                      bed: bed,
                                      bath: bath,
                                      days: days.toList().toString(),
                                      latitude: latetude.toString(),
                                      longitude: longitude.toString(),
                                      floor: floor,
                                      categoryId: category,
                                      placeEn: placecontroller.text,
                                      place: placeArbiccontroller.text,
                                      image: file ?? File(''));
                            }
                          }

                          // NavegatorPush(context, const PayNowScreen());
                        },
                        textWidget: state is AddServceLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                S.of(context).EditService,
                                style: StylesData.font13,
                              ),
                        height: 54,
                        c: ConstColor.kMainColor),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void ShowModeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: OpenStreetMapSearchAndPick(
                  buttonTextStyle: const TextStyle(
                      fontSize: 18, fontStyle: FontStyle.normal),
                  // center: LatLong(23, 89),
                  // buttonHeight: ,
                  buttonColor: Colors.blue,
                  buttonText: S.of(context).SetCurrentLocation,
                  onPicked: (pickedData) {
                    setState(() {
                      latetude = pickedData.latLong.latitude;
                      longitude = pickedData.latLong.longitude;
                      address =
                          '${pickedData.address['city'].toString()} - ${pickedData.address['state'].toString()}';
                    });
                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                    Navigator.pop(context);
                  }));
        });
  }
}
