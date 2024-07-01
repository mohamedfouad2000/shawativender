import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shawativender/Feature/forget%20password/presentation/views/widgets/set_new_password.dart';
import 'package:shawativender/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawativender/generated/l10n.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key, required this.PhoneNumber});
  final String PhoneNumber;

  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationTextId = '';
  String otpMsq = '';
    late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _startTimer();
    // verifyPhoneNumber(widget.PhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            S.of(context).Dont_worry_take_iteasy,
            style: StylesData.font24Google,
          ),
          Text(
            S.of(context).Enter_The_Code_Sent_To_You_At,
            style: StylesData.font12,
          ),
          Text(
            widget.PhoneNumber.toString()
                .substring(1, widget.PhoneNumber.length),
            style: StylesData.font12,
          ),
          const SizedBox(
            height: 60,
          ),
          OtpTextField(
            numberOfFields: 6,
            keyboardType: TextInputType.number,

            fieldHeight: 60,
            fieldWidth: 40,
            borderColor: ConstColor.kMainColor,
           focusedBorderColor: ConstColor.kMainColor,
            borderRadius: BorderRadius.circular(20),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              print("code is $code");
              otpMsq = code;
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              // showDialog(
              //   context: context,
              //   builder: (context){
              //   return AlertDialog(
              //       title: Text("Verification Code"),
              //       content: Text('Code entered is $verificationCode'),
              //   );});
              print("code is $verificationCode");
              otpMsq = verificationCode;
              print('otpMsq is $otpMsq');
              print('verificationTextId is $verificationTextId');

              if (otpMsq == verificationTextId) {
                print("done man");
              } else {
                print("Dont This ");
              }
            }, // end onSubmit
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Color(0xffEEF3FF),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(20),
          //     ),
          //   ),
          //   height: 40,
          //   width: 180,
          //   child: Center(
          //     child: Text(
          //       S.of(context).IHaventrecevedacode,
          //       style: StylesData.font11,
          //     ),
          //   ),

          //   //
          // ),

          const SizedBox(
            height: 60,
          ),
          defaultButton(
              fun: () {
                // otpMsq
                if (otpMsq.length == 6) {
                  if(otpMsq=='111111'){
                    NavegatorPush(
          context,
          SetNewpassword(
            PhoneNumber: widget.PhoneNumber,
          ));

                  }
                  else {
                  showToast(msq: S.of(context).OTP_eroor);

                  }
                  // signInWithPhoneNumber(otpMsq);
                } else {
                  showToast(msq: S.of(context).OTP_eroor);
                }

                // if (otpMsq.length == 6) {

                // }

                // NavegatorPush(
                //     context,
                //     SetNewpassword(
                //       PhoneNumber: widget.PhoneNumber,
                //     ));
              },
              textWidget: Text(
                S.of(context).SendOTP,
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
  }


void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  Future<void> verifyPhoneNumber(String verifyPhoneNumber) async {
    print('verifyPhoneNumber is $verifyPhoneNumber');
    await auth.verifyPhoneNumber(
      phoneNumber: verifyPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
          _timer.cancel();
      },
      verificationFailed: (FirebaseAuthException e) {
        showToast(msq: e.message.toString());
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationTextId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationTextId = verificationId;
      },
    );
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
      NavegatorPush(
          context,
          SetNewpassword(
            PhoneNumber: widget.PhoneNumber,
          ));
    } catch (e) {
      showToast(msq: S.of(context).OTP_eroor);
      print('Failed to sign in: ${e.toString()}');
    }
  }
}
