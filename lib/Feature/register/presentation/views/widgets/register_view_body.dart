import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/local/cache_Helper.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Terms%20And%20Privacy%20cubit/terms_and_privacy_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/terms_screen.dart';
import 'package:shawativender/Feature/location/presentation/views/enable_location_view.dart';
import 'package:shawativender/Feature/register/data/repo/register_repo_imple.dart';
import 'package:shawativender/Feature/register/presentation/manager/cubit/register_cubit.dart';
import 'package:shawativender/Feature/register/presentation/manager/cubit/register_state.dart';
import 'package:shawativender/Feature/register/presentation/views/widgets/login_here.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:intl_phone_field/countries.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody(
      {super.key,
      required this.phoneController,
      required this.passwordController,
      required this.nameController,
      required this.confirmpasswordController});
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController confirmpasswordController;

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String eroorMsq = '';
  bool isPhoneValidated = false;

  String code = '';
  bool isChecked = false;
  String country = 'Saudi Arabia';
  bool obscureTextconpass = true;
  bool obscureTextpass = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.phoneController.text = code;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterRepoImpl()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSucc) {
            if (state.model.data?.token != null) {
              TOKEN = state.model.data!.token!;

              CacheHelper.saveData(key: 'Token', value: TOKEN).then((value) => {
                    Nav(
                        context,
                        const EnableLocation(
                          fromLogin: true,
                        ))
                  });
            }
          } else if (state is RegisterError) {
            showToast(msq: state.eroorMsq.toString());
          }
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Center(
                              child: SizedBox(
                                  width: 120, child: SplachViewImage())),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            S.of(context).Createnew,
                            style: StylesData.font24Google,
                          ),
                          Text(
                            S.of(context).Account,
                            style: StylesData.font24Google,
                          ),
                          Text(
                            S.of(context).Areyouready,
                            style: StylesData.font12,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextFormedFiled(
                              controller: widget.nameController,
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
                          // customTextFormedFiled(
                          //     controller: widget.phoneController,
                          //     hintText: S.of(context).phone,
                          //     type: TextInputType.number,
                          //     sufficon: InkWell(
                          //       onTap: () {
                          //         showCountryPicker(
                          //           context: context,

                          //           showPhoneCode:
                          //               true, // optional. Shows phone code before the country name.
                          //           onSelect: (Country country) {
                          //             // country.countryCode;
                          //             setState(() {
                          //               code = country.phoneCode;
                          //               widget.phoneController.text = code;
                          //               print(country.flagEmoji);

                          //               // print(code);
                          //             });
                          //           },
                          //         );
                          //       },
                          //       child: SizedBox(
                          //         width: 80,
                          //         child: Row(
                          //           children: [
                          //             const Icon(
                          //                 Icons.arrow_drop_down_outlined),
                          //             // const SizedBox(
                          //             //   width: 10,
                          //             // ),
                          //             // const CircleAvatar(
                          //             //   radius: 12,
                          //             //   backgroundImage:
                          //             //       AssetImage(AssetsData.suadLogo),
                          //             // ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             const Image(
                          //               image:
                          //                   AssetImage(AssetsData.vectorLogo),
                          //               height: 20,
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               code,
                          //               style: StylesData.font12,
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     preicon: Padding(
                          //       padding: const EdgeInsets.all(12.0),
                          //       child: ImageIcon(
                          //         const AssetImage(
                          //           AssetsData.calling,
                          //         ),
                          //         size: 12,
                          //         color: ConstColor.kMainColor,
                          //       ),
                          //     )),

                          IntlPhoneField(
                            invalidNumberMessage: S.of(context).phone_eroor,
                            searchText: S.of(context).search,
                            languageCode:
                                LocalizationCubit.get(context).isArabic()
                                    ? 'ar'
                                    : 'en',
                            initialCountryCode: 'EG',
                            countries: countries
                                .where(
                                    (element) => ['EG'].contains(element.code))
                                .toList(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (phone) {
                              if (phone.number[0] == '0') {
                                // print("sha is ${phone.number[0]}");

                                setState(() {
                                  widget.phoneController.text = '';
                                });
                              }
                              code = phone.countryCode.substring(1);
                              print(phone.completeNumber);
                            },
                            style: StylesData.font14
                                .copyWith(color: ConstColor.kMainColor),
                            onSaved: (phone) {
                              // Save the phone number
                            },
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            controller: widget.phoneController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              hintText: S.of(context).phone,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ImageIcon(
                                  const AssetImage(
                                    AssetsData.calling,
                                  ),
                                  size: 12,
                                  color: ConstColor.kMainColor,
                                ),
                              ),
                              hintStyle: StylesData.font14.copyWith(
                                  color: const Color.fromARGB(51, 5, 98, 228)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: ConstColor.kMainColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            // initialCountryCode: 'SA',
                            enabled: true,
                            focusNode: focusNode,
                            validator: (value) {
                              print(value!.number.length);
                              print(value.number.isEmpty);
                              print('llllll,,');
                              if (value.number.isEmpty) {
                                return S.of(context).phone_eroor;
                              } else if (value.number.length < 10) {
                                return S.of(context).phone_eroor;
                              } else if (value.number[0] == '0') {
                                return S.of(context).phone_eroor;
                              }
                              print(value.number.length);
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormedFiled(
                              controller: widget.passwordController,
                              hintText: S.of(context).password,
                              obscureText: obscureTextpass,
                              sufficon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      obscureTextpass = !obscureTextpass;
                                    });
                                  },
                                  child: obscureTextpass
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
                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormedFiled(
                              controller: widget.confirmpasswordController,
                              hintText: S.of(context).confirmPassword,
                              obscureText: obscureTextconpass,
                              sufficon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      obscureTextconpass = !obscureTextconpass;
                                    });
                                  },
                                  child: obscureTextconpass
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: ConstColor.kMainColor,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).Iacceptallthe,
                                style: StylesData.font12,
                              ),
                              BlocProvider(
                                create: (context) =>
                                    TermsAndPrivacyCubit(HomeRepoImpl())
                                      ..getTermsAndPrivacy(),
                                child: BlocConsumer<TermsAndPrivacyCubit,
                                    TermsAndPrivacyState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                  },
                                  builder: (context, state) {
                                    if (state is GetTermsAndPrivacySucc) {
                                      return InkWell(
                                        onTap: () {
                                          NavegatorPush(
                                              context,
                                              TermsScreen(
                                                  termsText:
                                                      state.model.data?.term ??
                                                          '',
                                                  termsTextAr: state
                                                          .model.data?.termAr ??
                                                      ''));
                                        },
                                        child: Text(
                                          S.of(context).termsconditions,
                                          style: StylesData.font12.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      );
                                    } else if (state
                                        is GetTermsAndPrivacyError) {
                                      return Text(state.msg);
                                    } else {
                                      return const Text('');
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
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
                                style: StylesData.font14
                                    .copyWith(color: Colors.white),
                              )),
                            ),
                          if (eroorMsq != '')
                            const SizedBox(
                              height: 20,
                            ),
                          defaultButton(
                              fun: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (widget.phoneController.text != '') {
                                    if (isChecked) {
                                      if (widget.passwordController.text ==
                                          widget
                                              .confirmpasswordController.text) {
                                        if (widget.passwordController.text
                                                .length >
                                            7) {
                                          String? fcmToken = '';
                                          fcmToken = await FirebaseMessaging
                                              .instance
                                              .getToken();
                                          print("Token is $fcmToken");
                                          BlocProvider.of<RegisterCubit>(
                                                  context)
                                              .registerUser(
                                                  name: widget
                                                      .nameController.text,
                                                  fcmToken: fcmToken ?? '',
                                                  phone:
                                                      '$code${widget.phoneController.text}',
                                                  password: widget
                                                      .passwordController.text,
                                                  confirmPassword: widget
                                                      .confirmpasswordController
                                                      .text);
                                        } else {
                                          setState(() {
                                            eroorMsq = S.of(context).eroor507;
                                          });
                                        }

                                        //code here
                                      } else {
                                        setState(() {
                                          eroorMsq =
                                              S.of(context).passwordErorr;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        eroorMsq = S
                                            .of(context)
                                            .pleaseaccepttermsandconditions;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      eroorMsq = S.of(context).PhoneError;
                                    });
                                  }
                                }

                                // NavegatorPush(
                                //     context,
                                //     const LangPageView(
                                //       fromLogin: true,
                                //     ));
                              },
                              textWidget: state is RegisterLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      S.of(context).SignUp,
                                      style: StylesData.font13,
                                    ),
                              height: 54,
                              c: ConstColor.kMainColor),
                          const SizedBox(
                            height: 20,
                          ),
                          const LoginInHere(),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).Powered_By),
                            const TqniaLogo(),
                          ],
                        )),
                  )
                ],
              ));
        },
      ),
    );
  }
}
