// import 'package:country_picker/country_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:location/location.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget defaultButton({
  required VoidCallback fun,
  required textWidget,
  required Color c,
  double radius = 20,
  double height = 63,
  double width = double.infinity,
}) =>
    InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(
            radius,
          ),
          border: Border.all(
            color: ConstColor.kMainColor, //                   <--- border color
          ),
        ),
        child: Center(
          child: textWidget,
        ),
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        TextInputType type = TextInputType.name,
        Widget? prefixIcon,
        var ontapFun,
        String? hintText,
        bool enabled = true,
        Function(String)? onChanged,
        double rad = 10,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: type,
      style: StylesData.font14.copyWith(color: ConstColor.kMainColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ConstColor.kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required controller,
  TextInputType type = TextInputType.name,
  Widget? preicon,
  bool obscureText = false,
  bool enabled = true,
  String val = "",
  Widget? sufficon,
  String? hintText,
  Function(String)? onChanged,
  Function()? onTap,
  Function()? sufFunction,
  double rad = 10,
  maxLines = 1,
  // required void Function()? onPressed,
}) =>
    TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        print("object is $value");

        if (value != null && value.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      style: StylesData.font14.copyWith(color: ConstColor.kMainColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintText: hintText,
        prefixIcon: preicon,
        suffixIcon: sufficon ?? const SizedBox(),
        // isDense: true,
        // suffixIconConstraints: const BoxConstraints(
        //   minWidth: 2,
        //   minHeight: 2,
        // ),

        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ConstColor.kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),

        // labelText: 'Password',
      ),
    );

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

void navigateWithAnimation(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration:
          const Duration(milliseconds: 500), // Set your desired duration
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
    ),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

Color colorHex(String color) {
  print(color);
  if (color == '' || color == 'null') {
    return ConstColor.kMainColor;
  }
  return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
}

// Widget countryPicker(context) => InkWell(
//       onTap: () {
//         showCountryPicker(
//           context: context,
//           showPhoneCode:
//               true, // optional. Shows phone code before the country name.
//           onSelect: (Country country) {
//             country.countryCode;
//             print('Select country: ${country.displayName}');
//           },
//         );
//       },
//       child: SizedBox(
//         width: 130,
//         child: Row(
//           children: [
//             const Icon(Icons.arrow_drop_down_outlined),
//             const SizedBox(
//               width: 10,
//             ),
//             const CircleAvatar(
//               radius: 12,
//               backgroundImage: AssetImage(AssetsData.suadLogo),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             const Image(
//               image: AssetImage(AssetsData.vectorLogo),
//               height: 20,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               "+966",
//               style: StylesData.font12,
//             ),
//           ],
//         ),
//       ),
//     );

AppBar customAppBar(context,
    {Widget widget = const SizedBox(), Widget title = const SizedBox()}) {
  return AppBar(
    actions: [widget],
    centerTitle: true,
    title: title,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
  );
}

AppBar customAppBarWithNotification(context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          NavegatorPush(context, const NotificationScreen());
        },
        child: Padding(
          padding: LocalizationCubit.get(context).isArabic()
              ? const EdgeInsets.only(left: 14.0)
              : const EdgeInsets.only(right: 14.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(AssetsData.notification),
                height: 15,
                width: 15,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

AppBar customAppBarInNotification(
  context, {
  void Function()? ontap,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: ontap ??
            () {
              Navigator.pop(context);
            },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.only(
                right: LocalizationCubit.get(context).isArabic() ? 0 : 8.0,
                left: LocalizationCubit.get(context).isArabic() ? 8.0 : 0),
            child: const Row(
              children: [
                // const Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     CircleAvatar(
                //       radius: 10,
                //       backgroundColor: Colors.black,
                //     ),
                //     CircleAvatar(
                //       backgroundColor: Colors.white,
                //       radius: 9,
                //       child: Center(
                //           child: Icon(
                //         Icons.check,
                //         size: 10,
                //       )),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   width: 6,
                // ),
                // Text(
                //   S.of(context).MakeAllRead,
                //   style: StylesData.font12,
                // )
              ],
            )),
      ),
    ],
  );
}

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    return false; // No internet connection
  } else {
    return true; // Connected to the internet
  }
}

openDialPad(String phoneNumber) async {
  Uri url = Uri(scheme: "tel", path: phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print("Can't open dial pad.");
  }
}

AppBar customAppBarWithCallender(context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: const [],
  );
}

showToast({required String msq}) => Fluttertoast.showToast(
    msg: msq,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 18.0);

Widget CachedImage(String url, {double? height, double? width}) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: url,
        height: height,
        fit: BoxFit.cover,
        width: width,
        placeholder: (context, url) => LoadingAnimationWidget.newtonCradle(
          size: 50,
          color: Colors.grey,
        ),
        errorWidget: (context, url, er) => Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(Icons.info_outline),
        ),
      ),
    );

Future<LocationData> getloction() async {
  Location location = Location();
  bool? servesenable;
  PermissionStatus? permison;
  LocationData? locationdata;
  servesenable = await location.serviceEnabled();
  if (!servesenable) {
    servesenable = await location.requestService();
    if (!servesenable) {
      // return;
    }
  }
  permison = await location.hasPermission();
  if (permison == PermissionStatus.denied) {
    permison = await location.requestPermission();
    if (permison != PermissionStatus.granted) {
      // return;
    }
  }

  locationdata = await location.getLocation();
  return locationdata;
  // lat = locationdata.latitude;
  // long = locationdata.longitude;
}

textNumber({required String number}) async {
  // Android
  var uri = "https://wa.me/$number?text=Hello";
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    // iOS
    uri = "https://wa.me/$number?text=Hello";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

Widget customDropDownList(
        {required List<String> list,
        String? item,
        required String hintText,
        required void Function(String?)? onChanged,
        Widget prefixIcon = const SizedBox(),
        String Function(String)? itemAsString}) =>
    DropdownSearch<String>(
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: StylesData.font14.copyWith(color: ConstColor.kMainColor),
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelStyle: StylesData.font14.copyWith(color: Colors.red),
          filled: true,
          fillColor: Colors.white,
          // labelText: hintText,
          hintText: hintText,
          hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          suffixIconColor: Colors.grey[300],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: ConstColor.kMainColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      popupProps: PopupProps.menu(
          showSearchBox: true,
          fit: FlexFit.loose,
          searchFieldProps: TextFieldProps(
            style: StylesData.font14.copyWith(color: ConstColor.kMainColor),
            decoration: InputDecoration(
              hoverColor: Colors.black,
              hintText: hintText,
              hintStyle:
                  StylesData.font14.copyWith(color: const Color(0x330D223F)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // labelText: 'Password',
            ),
          )),
      items: list,
      itemAsString: itemAsString,
      dropdownButtonProps: const DropdownButtonProps(),
      onChanged: onChanged,
      enabled: true,
      selectedItem: item,
    );

launchWhatsApp({required String phone}) async {
  // Replace '+123456789' with the recipient's phone number
  // and 'Hello!' with your message.
  var url = "https://wa.me/$phone?text=Hello!";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

sendEmail({required String emailAdd}) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

// ···
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAdd,
    query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!',
    }),
  );

  launchUrl(emailLaunchUri);
}

launchMapsUrl(double lat, double lng) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
