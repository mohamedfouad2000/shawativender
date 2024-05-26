import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninWithWidget extends StatelessWidget {
  const SigninWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            await signInWithGoogle().then((value) {
              print('RRR${value.user}');
              print(value.user);
            });
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: CircleAvatar(
              radius: 12.5,
              backgroundImage: AssetImage(AssetsData.googleLogo),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: CircleAvatar(
            radius: 12.5,
            backgroundImage: AssetImage(AssetsData.appleLogo),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          child: CircleAvatar(
            radius: 12.5,
            backgroundImage: AssetImage(AssetsData.facebookLogo),
          ),
        ),
      ],
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
