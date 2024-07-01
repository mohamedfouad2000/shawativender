import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/forget%20password/presentation/views/widgets/set_new_password.dart';
import 'package:shawativender/Feature/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     NavegatorPush(
      //         context, const SetNewpassword(PhoneNumber: '201093549327'));
      //   },
      // ),
      body: LoginViewBody(
        phoneController: phoneController,
        passwordController: passwordController,
      ),
    );
  }
}
