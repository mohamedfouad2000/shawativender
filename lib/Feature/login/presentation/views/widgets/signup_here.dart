import 'package:flutter/material.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/register/presentation/views/register_view.dart';
import 'package:shawativender/generated/l10n.dart';

class SignUpHere extends StatelessWidget {
  const SignUpHere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).Donthaveanaccount,
          style: StylesData.font14,
        ),
        InkWell(
          onTap: () {
            NavegatorPush(context, const RegisterView());
          },
          child: Text(
            S.of(context).SignuPHere,
            style: StylesData.font14.copyWith(
                color: ConstColor.kMainColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
