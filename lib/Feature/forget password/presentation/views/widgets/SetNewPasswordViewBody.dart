import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/forget%20password/manager/cubit/set_password_cubit.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/login/presentation/views/login_view.dart';
import 'package:shawativender/generated/l10n.dart';

class SetNewPasswordViewBody extends StatefulWidget {
  const SetNewPasswordViewBody(
      {super.key,
      required this.PhoneNumber,
      required this.passwordController,
      required this.confirmpasswordController});
  final String PhoneNumber;
  final TextEditingController passwordController;
  final TextEditingController confirmpasswordController;
  @override
  State<SetNewPasswordViewBody> createState() => _SetNewPasswordViewBodyState();
}

class _SetNewPasswordViewBodyState extends State<SetNewPasswordViewBody> {
  bool obscureTextconpass = true;
  bool obscureTextpass = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (context) => SetPasswordCubit(HomeRepoImpl()),
        child: BlocConsumer<SetPasswordCubit, SetPasswordState>(
          listener: (context, state) {
            if (state is setPasswordSucc) {
              showToast(msq: state.msg.toString());
              Nav(context, const LoginView());
            } else if (state is setPasswordError) {
              showToast(msq: state.msg.toString());
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                    Text(
            S.of(context).SetNewPassword,
            style: StylesData.font24Google,
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
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      fun: () async {
                        if (_formKey.currentState!.validate()) {
                          if (widget.confirmpasswordController.text ==
                              widget.passwordController.text) {
                            BlocProvider.of<SetPasswordCubit>(context)
                                .setPassword(
                              confirmnewpassord:
                                  widget.confirmpasswordController.text,
                              newpassord: widget.passwordController.text,
                              phone: widget.PhoneNumber,
                            );
                          } else {
                            showToast(msq: S.of(context).passwordErorr);
                          }
                        }
                      },
                      textWidget: state is setPasswordLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              S.of(context).confirmPassword,
                              style: StylesData.font13,
                            ),
                      height: 54,
                      c: ConstColor.kMainColor),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
