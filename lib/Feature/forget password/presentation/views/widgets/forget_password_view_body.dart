import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/forget%20password/manager/cubit/set_password_cubit.dart';
import 'package:shawativender/Feature/forget%20password/presentation/views/opt_view.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawativender/generated/l10n.dart';
import 'package:intl_phone_field/countries.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String code = '+20';
  String verificationTextId = '';
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetPasswordCubit(HomeRepoImpl()),
      child: BlocConsumer<SetPasswordCubit, SetPasswordState>(
        listener: (context, state) {
          if (state is CheckPhoneSucc) {
            if (state.check == true) {
              NavegatorPush(
                  context,
                  OPTView(
                    PhoneNumber: '$code${phoneController.text}',
                  ));
            } else {
              showToast(msq: S.of(context).phone_eroor);
            }
          } else if (state is CheckPhoneError) {
            showToast(msq: state.msg.toString());
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  S.of(context).ForgotYourPassword.substring(
                      0, S.of(context).ForgotYourPassword.length - 1),
                  style: StylesData.font24Google,
                ),
                // Text(
                //   'Don’t worry, take it easy!',
                //   style: StylesData.font12,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                const Image(
                  image: AssetImage(
                    AssetsData.forgetPassword,
                  ),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  // disableLengthCheck: true,
                  invalidNumberMessage: S.of(context).phone_eroor,
                  searchText: S.of(context).search,

                  languageCode:
                      LocalizationCubit.get(context).isArabic() ? 'ar' : 'en',
                  initialCountryCode: 'EG',
                  countries: countries
                      .where((element) => [
                            'EG',
                            'SA',
                            'MA',
                            'TN',
                            'DZ',
                            'AE',
                            'KW',
                            'OM',
                            'QA',
                            'BH',
                            'JO',
                            'SY',
                            'PS',
                            'LB',
                            'IQ',
                            'LY',
                            'MR',
                            'SD',
                            'SO',
                            'YE',
                            'KM',
                            'DJ',
                            'TN',
                            'MR',
                            'MA',
                            'DZ',
                            'EG',
                            'SS'
                          ].contains(element.code))
                      .toList(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (phone) {
                    if (phone.number[0] == '0') {
                      print("sha is ${phone.number[0]}");

                      setState(() {
                        phoneController.text = '';
                      });
                    }
                    code = phone.countryCode;
                    print("$code${phoneController.text}");

                    print(phone.completeNumber); //get complete number
                    print(phone.countryCode); // get country code only
                    print(phone.number);
                  },
                  style:
                      StylesData.font14.copyWith(color: ConstColor.kMainColor),
                  // onSaved: (phone) {
                  //   // Save the phone number
                  // },
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  controller: phoneController,
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
                    hintStyle: StylesData.font14
                        .copyWith(color: const Color(0x330D223F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: ConstColor.kMainColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),

                  enabled: true,

                  // focusNode: focusNode,
                  validator: (value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.number.isEmpty) {
                      return S.of(context).phone_eroor;
                    } else if (!regExp.hasMatch(value.number)) {
                      return S.of(context).phone_eroor;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    fun: () async {
                      if (phoneController.text.isEmpty) {
                        showToast(msq: S.of(context).phone_eroor);
                      } else {
                        print('phone is ya man $code${phoneController.text}');
                        BlocProvider.of<SetPasswordCubit>(context)
                            .checkPhone(phone: '$code${phoneController.text}');
                        print("object is $code${phoneController.text}");
                      }

                      // signInWithPhoneNumber('111111');
                      // NavegatorPush(context,
                      //     OPTView(PhoneNumber: '+$code${phoneController.text}'));
                    },
                    textWidget: state is CheckPhoneLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            S.of(context).Resetpassword,
                            style: StylesData.font13,
                          ),
                    height: 54,
                    c: ConstColor.kMainColor),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).Powered_By),
                    const TqniaLogo(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+201061696047',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('Error On OTP: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationTextId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationTextId = verificationId;
      },
    );
  }

  Future<void> phoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+201061696047',
      // timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        print('verificationCompleted');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('eroor man ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        print('code sent');
        verificationTextId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("object u");
        verificationTextId = verificationId;
      },
    );
  }

  Future<void> sendMsq(String verificationId) async {
    try {
      String smsCode = 'xxxx';

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential).then((value) {
        NavegatorPush(
            context,
            OPTView(
              PhoneNumber: '+$code${phoneController.text}',
            ));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void signInWithPhoneNumber(String smsCode) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationTextId,
        smsCode: smsCode,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      // Handle successful sign-in here
      print('Successfully signed in: ${userCredential.user!.uid}');
    } catch (e) {
      print('Failed to sign in: ${e.toString()}');
    }
  }
}
