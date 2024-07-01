import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Feature/forget%20password/presentation/views/widgets/SetNewPasswordViewBody.dart';

class SetNewpassword extends StatelessWidget {
  const SetNewpassword({super.key, required this.PhoneNumber});
  final String PhoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(context),
        body: SetNewPasswordViewBody(
            PhoneNumber: PhoneNumber,
            passwordController: passwordController,
            confirmpasswordController: confirmpasswordController));
  }
}
