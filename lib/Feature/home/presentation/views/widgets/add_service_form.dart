import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Add%20Serves/add_servce_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Features%20Cubit/featured_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_add_image.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddServiceForm extends StatefulWidget {
  const AddServiceForm({super.key});

  @override
  State<AddServiceForm> createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
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
  Map<int, String> features = {};
  String error = '';
  String bed = '';
  String bath = '';
  String floor = '';
  String category = '';
  double latetude = 0.0;
  double longitude = 0.0;
  String address = '';
  Set<String> days = {};

  List<XFile> imageFileList = [];

  void addListToTimes() {
    Times = [];

    _datePickerController.selectedRanges?.forEach((element) {
      DateTime? x = element.startDate;
      print(x);
      print(element.endDate.toString());

      print(DateTime.now().isBefore(x!));

      print("Out Of While");

      if (element.endDate.toString() == 'null') {
        Times.add(element.startDate);
      } else {
        while (x!.isBefore(element.endDate!)) {
          print(x);

          Times.add(x);
          x = x.add(const Duration(days: 1));
        }
        Times.add(element.endDate);
      }
    });
  }

  void selectImages() async {
    final List<XFile> selectFileList = await picker.pickMultiImage();
    if (selectFileList.isNotEmpty) {
      imageFileList.addAll(selectFileList);
    }
    setState(() {});
  }
  //  Set<int> featuresIds = {};

  Map<String, int> eventDays = {};
  List<List> dataTimes = [];
  final DateRangePickerController _datePickerController =
      DateRangePickerController();
  List<DateTime?> Times = [];

  File? file;
  ImagePicker picker = ImagePicker();
  var formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GetCategoryCubit(HomeRepoImpl())..getCategory()),
        BlocProvider(
          create: (context) => AddServceCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => FeaturedCubit(HomeRepoImpl())..getFeaturesData(),
        ),
      ],
      child: BlocConsumer<AddServceCubit, AddServceState>(
        listener: (context, state) {
          if (state is AddServceSucc) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).Successfull
                    : state.msq.toString());
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is AddServceError) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).oppsMessage
                    : state.msg.toString());
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                customTextFormedFiled(
                    controller: Propertynamecontroller,
                    hintText: S.of(context).Property_Name,
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
                    hintText: S.of(context).Property_Name_With_Arabic,
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
                          // item: category,
                          onChanged: (p0) {
                            print(p0);
                            category = p0.toString();
                          },
                          itemAsString: (String u) {
                            String x = '';
                            for (var element in state.list) {
                              if (u == element.id.toString()) {
                                x = LocalizationCubit.get(context).isArabic()
                                    ? element.brandNameAr!
                                    : element.brandName!;
                              }
                            }
                            print(x);
                            return x.toString();
                          },
                          list: [
                            ...List.generate(state.list.length,
                                (index) => state.list[index].id.toString()),
                          ],
                          hintText: S.of(context).Category,
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
                customTextFormedFiled(
                    controller: placecontroller,
                    hintText: S.of(context).Place,
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
                    hintText: S.of(context).Place_With_Arabic,
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
                    type: TextInputType.number,
                    hintText: S.of(context).price,
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
                    // item: bed,
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
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                    ],
                    hintText: S.of(context).bedRooms,
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
                    // item: bath,
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
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                    ],
                    hintText: S.of(context).bathRooms,
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
                    // item: floor,
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
                      '11',
                      '12',
                      '13',
                      '14',
                      '15',
                      '16',
                      '17',
                      '18',
                      '19',
                      '20',
                    ],
                    hintText: S.of(context).floor,
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
                      hintText: S.of(context).Description,
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
                      hintText: S.of(context).Description_Arabic,
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
                // InkWell(
                //     onTap: () {
                //       var x = AlertDialog(
                //         surfaceTintColor: Colors.white,
                //         title: Text(
                //           S.of(context).ChooseYourPhoto,
                //         ),
                //         content: SizedBox(
                //           height: 140,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Container(
                //                   height: 50,
                //                   width: double.infinity,
                //                   color:
                //                       Theme.of(context).colorScheme.background,
                //                   child: TextButton.icon(
                //                       label: Text(
                //                         S.of(context).Gallary,
                //                         style: const TextStyle(
                //                             color: Colors.black),
                //                       ),
                //                       onPressed: () async {
                //                         getuserprofile(i: ImageSource.gallery);
                //                         Navigator.pop(context);
                //                       },
                //                       icon: const Icon(
                //                         Icons.storage_outlined,
                //                         color: Colors.black,
                //                       ))),
                //               const SizedBox(
                //                 height: 20,
                //               ),
                //               Container(
                //                   height: 50,
                //                   width: double.infinity,
                //                   color:
                //                       Theme.of(context).colorScheme.background,
                //                   child: TextButton.icon(
                //                       label: Text(
                //                         S.of(context).camera,
                //                         style: const TextStyle(
                //                             color: Colors.black),
                //                       ),
                //                       onPressed: () {
                //                         getuserprofile(i: ImageSource.camera);
                //                         Navigator.pop(context);
                //                       },
                //                       icon: const Icon(
                //                         Icons.camera_alt_outlined,
                //                         color: Colors.black,
                //                       ))),
                //             ],
                //           ),
                //         ),
                //       );
                //       showDialog(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return x;
                //           });
                //     },
                //     child: file == null
                //         ? const CustomAddImage()
                //         : Container(
                //             width: double.infinity,
                //             padding: const EdgeInsets.all(12),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 border:
                //                     Border.all(color: Colors.grey.shade300)),
                //             child: Column(
                //               children: [
                //                 Container(
                //                   height: 130,
                //                   width: 130,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(20),
                //                   ),
                //                   child: Image.file(file!),
                //                 ),
                //               ],
                //             ),
                //           )),
                // const SizedBox(
                //   height: 15,
                // ),

                // const Text("Add Gallary Images "),
                const SizedBox(
                  height: 7,
                ),
                InkWell(
                    onTap: () {
                      selectImages();
                    },
                    child: imageFileList.isEmpty
                        ? const CustomAddImage()
                        : Container(
                            width: double.infinity,
                            height: 200,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.file(
                                          File(imageFileList[index].path)),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            imageFileList.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                );
                              },
                              itemCount: imageFileList.length,
                            ))),
                const SizedBox(
                  height: 15,
                ),
                SfDateRangePicker(
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                      selectionTextStyle: TextStyle(color: Colors.white),
                      blackoutDatesDecoration: BoxDecoration(
                          color: Colors.red,
                          // border: Border.all(color: Color(0xFFF44436), width: 1),
                          shape: BoxShape.circle),
                      blackoutDateTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough),
                      specialDatesTextStyle: TextStyle(color: Colors.white),
                      selectionColor: Colors.white),
                  controller: _datePickerController,
                  selectionShape: DateRangePickerSelectionShape.circle,
                  headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      backgroundColor: Color(0xffF5F5F5)),
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
                  view: DateRangePickerView.month,
                  backgroundColor: const Color(0xffF5F5F5),
                  monthViewSettings:
                      const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                  selectionMode: DateRangePickerSelectionMode.multiRange,
                  onSubmit: (val) {
                    print("s");
                    print(val);
                  },
                ),
                // const SizedBox(
                //   height: 15,
                // ),

                // CalendarDatePicker2(
                //   onValueChanged: (value) {
                //     Times = value;

                //     for (var element in value) {
                //       print(element);

                //       //05/16/2024 3:52 PM
                //       String formattedDate =
                //           DateFormat('MM/dd/yyyy hh:mm a', 'en')
                //               .format(element!);

                //       print(formattedDate);
                //       setState(() {
                //         days.add(formattedDate);
                //       });
                //     }
                //   },
                //   config: CalendarDatePicker2Config(
                //       // selectedRangeHighlightColor: Colors.red,
                //       // enabled: false,

                //       disableModePicker: false,
                //       rangeBidirectional: false,
                //       calendarType: CalendarDatePicker2Type.multi,
                //       centerAlignModePicker: true),

                //   value: Times,
                //   // onValueChanged: (dates) => _dates = dates,
                // ),
                const SizedBox(
                  height: 15,
                ),
                if (latetude == 0 && longitude == 0)
                  defaultButton(
                      fun: () async {
                        ShowModeSheet(context);
                      },
                      textWidget: Text(
                        S.of(context).setlocation,
                        style: StylesData.font13.copyWith(color: Colors.black),
                      ),
                      height: 54,
                      c: Colors.white),
                if (latetude == 0 && longitude == 0)
                  const SizedBox(
                    height: 10,
                  ),
                // if (Times.isNotEmpty)
                defaultButton(
                    fun: () async {
                      showEventsDays(context);
                    },
                    textWidget: Text(
                      S.of(context).AddEventDays,
                      style: StylesData.font13.copyWith(color: Colors.black),
                    ),
                    height: 54,
                    c: Colors.white),
                const SizedBox(
                  height: 10,
                ),

                defaultButton(
                    fun: () async {
                      showFeatures(context);
                    },
                    textWidget: Text(
                      S.of(context).addFeature,
                      style: StylesData.font13.copyWith(color: Colors.black),
                    ),
                    height: 54,
                    c: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                // if (latetude != 0 && longitude != 0)

                // Center(child: Text("The Place is // $address")),

                // const SizedBox(
                //   height: 15,
                // ),

                if (latetude != 0 && longitude != 0)
                  defaultButton(
                      fun: () async {
                        ShowModeSheet(context);
                      },
                      textWidget: Text(
                        S.of(context).changeLocation,
                        style: StylesData.font13.copyWith(color: Colors.black),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                      error,
                      style: StylesData.font14.copyWith(color: Colors.white),
                    )),
                  ),
                if (error != '')
                  const SizedBox(
                    height: 20,
                  ),
                defaultButton(
                    fun: () {
                      addListToTimes();
                      dataTimes = [];

                      List<String> eventdaysList = [];
                      List<String> featuresList = [];
                      List<String> priceList = [];
                      List<String> daysList = [];
                      file = imageFileList.isNotEmpty
                          ? File(imageFileList.first.path)
                          : null;
                      _datePickerController.selectedRanges?.forEach((element) {
                        dataTimes.add([
                          element.startDate,
                          element.endDate ?? element.startDate
                        ]);
                      });
                      print('data time is ${dataTimes.toSet().toList()}');
                      // print(
                      //     'data time is ${_datePickerController.selectedRanges} ');

                      // for (var element in days) {
                      //   // s.add('"${element.toString()}"');
                      // }
                      // // print(' s is ${s.toString()} ');
                      print(eventDays.keys.toList());
                      days = {};
                      for (var element in Times) {
                        String formattedDate =
                            DateFormat('MM/dd/yyyy hh:mm a', 'en')
                                .format(element!);

                        print(formattedDate);
                        setState(() {
                          days.add(formattedDate);
                        });
                      }
                      for (var element in eventDays.keys) {
                        eventdaysList.add('"$element"');
                      }
                      for (var element in eventDays.values) {
                        priceList.add('"$element"');
                      }
                      for (var element
                          in FeaturedCubit.get(context).features.keys) {
                        featuresList.add('"$element"');
                      }
                      days.toList().forEach((element) {
                        daysList.add('"$element"');
                      });
                      print(eventdaysList);

                      print(eventDays.values.toList());

                      print(FeaturedCubit.get(context).features.keys.toList());

                      print(
                          'data is ${PropertynameArabiccontroller.text} and ${Propertynamecontroller.text} and ${descriptionArabiccontroller.text} and ${descriptioncontroller.text} and ${Pricecontroller.text} $bed $bath $days $latetude $longitude $floor $category ${placecontroller.text} ${placeArbiccontroller.text} ${file?.path} ');
                      if (formKey.currentState!.validate()) {
                        if (category == '' ||
                            bath == '' ||
                            bed == '' ||
                            floor == '' ||
                            latetude == 0 ||
                            longitude == 0 ||
                            days.isEmpty ||
                            file == null) {
                          setState(() {
                            error = S.of(context).error_Msq_add_service;
                          });
                        } else {
                          print("list is $days");

                          BlocProvider.of<AddServceCubit>(context).Addservice(
                              range_days: dataTimes,
                              name: PropertynameArabiccontroller.text,
                              nameEn: Propertynamecontroller.text,
                              description: descriptionArabiccontroller.text,
                              descriptionEn: descriptioncontroller.text,
                              price: Pricecontroller.text,
                              bed: bed,
                              bath: bath,
                              days: days.toList(),
                              latitude: latetude.toString(),
                              longitude: longitude.toString(),
                              floor: floor,
                              categoryId: category,
                              placeEn: placecontroller.text,
                              place: placeArbiccontroller.text,
                              eventDays: eventDays.keys.toList(),
                              eventprices: eventDays.values.toList(),
                              features: features.keys.toList(),
                              files: imageFileList,
                              image: file!);
                        }
                      }

                      // NavegatorPush(context, const PayNowScreen());
                    },
                    textWidget: state is AddServceLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            S.of(context).Addservice,
                            style: StylesData.font13,
                          ),
                    height: 54,
                    c: ConstColor.kMainColor),
              ],
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

  void showEventsDays(context) {
    addListToTimes();
    TextEditingController controller = TextEditingController();
    String? date;
    bool isloading = false;
    List<String> listDays = [];
    for (var element in Times) {
      String formattedDate =
          DateFormat('MM/dd/yyyy hh:mm a', 'en').format(element!);

      print(formattedDate);
      setState(() {
        listDays.add(formattedDate);
      });
    }
    var x = AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        S.of(context).AddEventDay,
      ),
      content: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          height: 350,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customDropDownList(
                    list: listDays.toList(),
                    hintText: S.of(context).SelectEventDays,
                    onChanged: (i) {
                      date = i!;
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextFiled(
                          controller: controller,
                          hintText: S.of(context).price,
                          type: TextInputType.number,
                          prefixIcon: const SizedBox()),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isloading = true;
                            eventDays[date!] = int.parse(controller.text);
                            print('eventdays is ${eventDays.length}');
                          });
                          isloading = false;
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 150,
                    child: isloading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: eventDays.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: InkWell(
                                  onTap: () {
                                    eventDays
                                        .remove(eventDays.keys.toList()[index]);
                                    setState(() {});
                                    // Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                leading: Text(
                                  '${eventDays.keys.toList()[index].toString().substring(0, 10)}    ${eventDays.values.toList()[index]} ${S.of(context).SAR}',
                                ),
                              );
                            },
                          )),
                defaultButton(
                    fun: () {
                      // setState(() {
                      //   eventDays[date!] = int.parse(controller.text);
                      //   print(eventDays.length);
                      // });
                      // print(eventDays.values);
                      Navigator.pop(context);
                    },
                    textWidget: Text(
                      S.of(context).close,
                      style: StylesData.font13,
                    ),
                    height: 54,
                    c: ConstColor.kMainColor),
              ],
            ),
          ),
        );
      }),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return x;
        });
  }

  void showFeatures(context) {
    // String? valuetxt;
    int? valueId;

    var x = AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        S.of(context).addFeature,
      ),
      content: SizedBox(
        height: 350,
        child: BlocProvider(
          create: (context) => FeaturedCubit(HomeRepoImpl())..getFeaturesData(),
          child: BlocConsumer<FeaturedCubit, FeaturedState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              FeaturedCubit.get(context).features = features;
              if (state is FeaturedLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (FeaturedCubit.get(context).model != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  underline: const SizedBox(),
                                  value: FeaturedCubit.get(context).value,
                                  alignment: AlignmentDirectional.centerStart,
                                  isExpanded: true,
                                  hint: Text(S.of(context).addFeature),
                                  onChanged: (String? selecteddata) {
                                    print("Aha ya Sahby");
                                    print(selecteddata);
                                    FeaturedCubit.get(context)
                                        .changeValue(value: selecteddata!);
                                    setState(() {
                                      FeaturedCubit.get(context).value =
                                          selecteddata;
                                    });
                                    for (var element
                                        in FeaturedCubit.get(context)
                                            .model!
                                            .data!) {
                                      if (FeaturedCubit.get(context).value ==
                                          element.featureName) {
                                        valueId = element.id;
                                      }
                                    }

                                    setState(() {});
                                  },
                                  items: FeaturedCubit.get(context)
                                      .model!
                                      .data
                                      ?.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item.featureName.toString(),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            '$xURLIMAGE${item.image}' ?? '',
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(width: 10),
                                          Text((LocalizationCubit.get(context)
                                                      .isArabic()
                                                  ? item.featureNameAr
                                                  : item.featureName) ??
                                              ''),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // features[date!] = int.parse(controller.text);
                                      FeaturedCubit.get(context)
                                          .addFeatureToList(id: valueId!);
                                    });
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          )),
                      SizedBox(
                          height: 150,
                          child: state is addOrRemoveLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: FeaturedCubit.get(context)
                                      .features
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: InkWell(
                                        onTap: () {
                                          print("object");
                                          FeaturedCubit.get(context)
                                              .removeFeatureFromList(id: index);

                                          // print(FeaturedCubit.get(context)
                                          //     .features[index]);
                                          // FeaturedCubit.get(context)
                                          //     .features
                                          //     .remove(FeaturedCubit.get(context)
                                          //         .features
                                          //         .keys
                                          //         .toList()[index]);
                                          // FeaturedCubit.get(context).features.remove(FeaturedCubit.get(context).features.toList()[index]);

                                          // FeaturedCubit.get(context).featuresIds.remove(FeaturedCubit.get(context).featuresIds.toList()[index]);
                                          print(
                                              "the FeaturedCubit.get(context).features is $FeaturedCubit.get(context).features and th index is $index");
                                          print(FeaturedCubit.get(context)
                                              .features);
                                          setState(() {});
                                          // Navigator.pop(context);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      leading: Text(
                                        FeaturedCubit.get(context)
                                            .features
                                            .values
                                            .toList()[index]
                                            .toString(),
                                        // features.toList()[index].toString(),
                                      ),
                                    );
                                  },
                                )),
                      defaultButton(
                          fun: () {
                            features = FeaturedCubit.get(context).features;
                            Navigator.pop(context);
                            // setState(() {
                            //   // features[date!] = int.parse(controller.text);
                            //   FeaturedCubit.get(context)
                            //       .model!
                            //       .data
                            //       ?.forEach((element) {
                            //     if (FeaturedCubit.get(context).value ==
                            //         element.featureName) {
                            //       valuetxt = element.id.toString();
                            //     }
                            //   });
                            //   features[valueId!] =
                            //       FeaturedCubit.get(context).value!;

                            //   print(FeaturedCubit.get(context).value);
                            //   print(features.length);
                            // });
                            // // print(eventDays.values);
                            // Navigator.pop(context);
                          },
                          textWidget: Text(
                            S.of(context).close,
                            style: StylesData.font13,
                          ),
                          height: 54,
                          c: ConstColor.kMainColor),
                    ],
                  ),
                );
              } else if (state is FeaturedError) {
                return Text(state.error);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return x;
        });
  }
}
