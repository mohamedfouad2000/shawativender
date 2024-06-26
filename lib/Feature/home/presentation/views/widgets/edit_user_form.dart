import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';
import 'package:shawativender/Feature/login/presentation/views/login_view.dart';
import 'package:shawativender/generated/l10n.dart';

class EditUserForm extends StatefulWidget {
  const EditUserForm({super.key});

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  bool obscureTextCurrentpass = true;
  bool ChangePassword = false;
  String code = '+20';
  String eroorMsq = '';
  String country = 'Saudi Arabia';
  bool obscureTextconpass = true;
  bool isDelete = false;

  bool obscureTextpass = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController confirmpasswordController = TextEditingController();
  File? file;
  ImagePicker picker = ImagePicker();

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
    return BlocProvider(
      create: (context) => ProfileCubit(HomeRepoImpl())..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileError) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).oppsMessage
                    : state.msg.toString());
            ProfileCubit.get(context).getProfileData();
          } else if (state is UpdateProfileSucc) {
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is DeleteAccountSucc) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).Successfull
                    : state.msq.toString());
            CacheHelper.removeData(key: 'Token');
            TOKEN = '';
            Nav(context, const LoginView());
          } else if (state is DeleteAccountError) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).oppsMessage
                    : state.msg.toString());

            ProfileCubit.get(context).getProfileData();
          }
        },
        builder: (context, state) {
          if (state is ProfileSucc || state is UpdateProfileLoading) {
            if (state is ProfileSucc) {
              phoneController.text = state.model.data!.phone!;
              nameController.text = state.model.data!.name!;
              // code = '+20';
            }

            return Form(
              key: formkey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        file == null
                            ? Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: state is ProfileSucc
                                    ? CachedImage(
                                        '$xURLIMAGE${BlocProvider.of<ProfileCubit>(context).model?.data?.image}')
                                    : const SizedBox(),
                              )
                            : Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.file(file!),
                              ),
                        if (file == null)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                getuserprofile(
                                                    i: ImageSource.camera);
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
                            child: Container(
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
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  customTextFormedFiled(
                      controller: nameController,
                      hintText: S.of(context).FullName,
                      preicon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ImageIcon(
                          const AssetImage(
                            AssetsData.profile,
                          ),
                          size: 12,
                          color: ConstColor.kMainColor,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFormedFiled(
                      controller: phoneController,
                      enabled: false,
                      hintText: S.of(context).phone,
                      preicon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ImageIcon(
                          const AssetImage(
                            AssetsData.calling,
                          ),
                          size: 12,
                          color: ConstColor.kMainColor,
                        ),
                      )),
                  // IntlPhoneField(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   onChanged: (phone) {
                  //     print(phone.completeNumber);
                  //   },
                  //   onSaved: (phone) {
                  //     // Save the phone number
                  //   },
                  //   dropdownDecoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   controller: phoneController,
                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         vertical: 12, horizontal: 16),
                  //     hintText: S.of(context).phone,
                  //     prefixIcon: Padding(
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: ImageIcon(
                  //         const AssetImage(
                  //           AssetsData.calling,
                  //         ),
                  //         size: 12,
                  //         color: ConstColor.kMainColor,
                  //       ),
                  //     ),
                  //     hintStyle: StylesData.font14
                  //         .copyWith(color: const Color(0x330D223F)),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide:
                  //           BorderSide(width: 1, color: ConstColor.kMainColor),
                  //       borderRadius: const BorderRadius.all(
                  //         Radius.circular(10),
                  //       ),
                  //     ),
                  //     border: const OutlineInputBorder(
                  //       borderSide:
                  //           BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       ),
                  //     ),
                  //     enabledBorder: const OutlineInputBorder(
                  //       borderSide:
                  //           BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       ),
                  //     ),
                  //   ),
                  //   initialCountryCode: 'SA',
                  //   enabled: false,

                  //   // focusNode: focusNode,
                  //   validator: (value) {
                  //     print(value!.number.length);
                  //     print(value.number.isEmpty);
                  //     print('llllll,,');
                  //     if (value.number.isEmpty) {
                  //       return "must be not Empty";
                  //     } else if (value.number.length < 10) {
                  //       return 'must not be less than 10 numbers';
                  //     }
                  //     print(value.number.length);
                  //     return null;
                  //   },
                  // ),

                  if (!ChangePassword)
                    const SizedBox(
                      height: 20,
                    ),
                  if (!ChangePassword)
                    defaultButton(
                        fun: () {
                          setState(() {
                            ChangePassword = true;
                          });

                          // if (formkey.currentState!.validate()) {
                          // if (phoneController.text != '') {
                          //   // if (passwordController.text ==
                          //   //     confirmpasswordController.text) {
                          //   BlocProvider.of<ProfileCubit>(context).updateProfile(
                          //     name: nameController.text,
                          //     phone: phoneController.text,
                          //     password: passwordController.text,
                          //     confirmPassword: confirmpasswordController.text,
                          //     image: file,
                          //   );
                          //   // }
                          //   // else {
                          //   //   setState(() {
                          //   //     eroorMsq = S.of(context).passwordErorr;
                          //   //   });
                          //   // }
                          // } else {
                          //   setState(() {
                          //     eroorMsq = S.of(context).PhoneError;
                          //   });
                          //   // }
                          // }
                        },
                        textWidget: Text(
                          S.of(context).ChangePassword,
                          style: StylesData.font13,
                        ),
                        height: 54,
                        c: ConstColor.kMainColor),
                  const SizedBox(
                    height: 20,
                  ),
                  if (ChangePassword)
                    customTextFormedFiled(
                        controller: currentPasswordController,
                        hintText: S.of(context).Currentpassword,
                        obscureText: obscureTextCurrentpass,
                        sufficon: InkWell(
                            onTap: () {
                              setState(() {
                                obscureTextCurrentpass =
                                    !obscureTextCurrentpass;
                              });
                            },
                            child: !obscureTextCurrentpass
                                ? const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                    size: 22,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ImageIcon(
                                      AssetImage(AssetsData.eye),
                                      color: Colors.grey,
                                      size: 6,
                                    ),
                                  )),
                        preicon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ImageIcon(
                            const AssetImage(
                              AssetsData.lock,
                            ),
                            size: 12,
                            color: ConstColor.kMainColor,
                          ),
                        )),
                  if (ChangePassword)
                    const SizedBox(
                      height: 20,
                    ),

                  if (ChangePassword)
                    customTextFormedFiled(
                        controller: passwordController,
                        hintText: S.of(context).password,
                        obscureText: obscureTextpass,
                        sufficon: InkWell(
                            onTap: () {
                              setState(() {
                                obscureTextpass = !obscureTextpass;
                              });
                            },
                            child: !obscureTextpass
                                ? const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                    size: 22,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ImageIcon(
                                      AssetImage(AssetsData.eye),
                                      color: Colors.grey,
                                      size: 6,
                                    ),
                                  )),
                        preicon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ImageIcon(
                            const AssetImage(
                              AssetsData.lock,
                            ),
                            size: 12,
                            color: ConstColor.kMainColor,
                          ),
                        )),
                  if (ChangePassword)
                    const SizedBox(
                      height: 20,
                    ),
                  if (ChangePassword)
                    customTextFormedFiled(
                        controller: confirmpasswordController,
                        hintText: S.of(context).confirmPassword,
                        obscureText: obscureTextconpass,
                        sufficon: InkWell(
                            onTap: () {
                              setState(() {
                                obscureTextconpass = !obscureTextconpass;
                              });
                            },
                            child: !obscureTextconpass
                                ? const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                    size: 22,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ImageIcon(
                                      AssetImage(AssetsData.eye),
                                      color: Colors.grey,
                                      size: 6,
                                    ),
                                  )),
                        preicon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ImageIcon(
                            const AssetImage(
                              AssetsData.lock,
                            ),
                            size: 12,
                            color: ConstColor.kMainColor,
                          ),
                        )),
                  if (ChangePassword)
                    const SizedBox(
                      height: 20,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).profile4,
                        style: StylesData.font11.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showAlertDialog(
                              context: context, fun: Future(() => null));
                          // ProfileCubit.get(context).deleteAccount();
                        },
                        child: Text(S.of(context).profile5,
                            style: StylesData.font11.copyWith(
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18),
                  //   child: Center(
                  //       child: RichText(
                  //     textAlign: TextAlign.center,
                  //     text: TextSpan(
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //             text: S.of(context).profile4,
                  //             style: StylesData.font11.copyWith(
                  //               color: Colors.grey,
                  //             )),
                  //         TextSpan(
                  //             text: S.of(context).profile5,
                  //             style: StylesData.font11.copyWith(
                  //               decoration: TextDecoration.underline,
                  //             )),
                  //       ],
                  //     ),
                  //   )),
                  // ),

                  const SizedBox(
                    height: 20,
                  ),

                  if (eroorMsq != '')
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
                        eroorMsq,
                        style: StylesData.font14.copyWith(color: Colors.white),
                      )),
                    ),
                  if (eroorMsq != '')
                    const SizedBox(
                      height: 20,
                    ),
                  defaultButton(
                      fun: () {
                        // if (formkey.currentState!.validate()) {
                        {
                          if (ChangePassword) {
                            if (formkey.currentState!.validate()) {
                              if (passwordController.text ==
                                  confirmpasswordController.text) {
                                BlocProvider.of<ProfileCubit>(context)
                                    .updateProfile(
                                  currentPassword:
                                      currentPasswordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmpasswordController.text,
                                  image: file,
                                );
                              } else {
                                setState(() {
                                  eroorMsq = S.of(context).passwordErorr;
                                });
                              }
                            }
                            // if (passwordController.text ==
                            //     confirmpasswordController.text) {

                            // }
                            // else {
                            //   setState(() {
                            //     eroorMsq = S.of(context).passwordErorr;
                            //   });
                            // }
                          } else {
                            BlocProvider.of<ProfileCubit>(context)
                                .updateProfile(
                              currentPassword: currentPasswordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              confirmPassword: confirmpasswordController.text,
                              image: file,
                            );
                          }
                          // }
                        }
                      },
                      textWidget: state is UpdateProfileLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              S.of(context).Update,
                              style: StylesData.font13,
                            ),
                      height: 54,
                      c: ConstColor.kMainColor),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Text(state.msg);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  showAlertDialog({required BuildContext context, required Future? fun}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(S.of(context).Cancel),
      onPressed: () {
        setState(() {
          isDelete = false;
        });
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child:
          Text(S.of(context).Delete, style: const TextStyle(color: Colors.red)),
      onPressed: () {
        setState(() {
          isDelete = true;
        });

        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(S.of(context).warning),
      content: Text(S.of(context).DeleteMsg),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) => isDelete == true
        ? BlocProvider.of<ProfileCubit>(context).deleteAccount()
        : null);
  }
}
