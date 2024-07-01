import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/constans/const.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/with%20Draw/with_draw_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/main_home_screen.dart';
import 'package:shawativender/generated/l10n.dart';

class AddWithDrawForm extends StatefulWidget {
  const AddWithDrawForm({super.key});

  @override
  State<AddWithDrawForm> createState() => _AddWithDrawFormState();
}

class _AddWithDrawFormState extends State<AddWithDrawForm> {
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureTextpass = true;
  String? value;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookingCubit(HomeRepoImpl())..getPaymentMethod(),
        ),
        BlocProvider(create: (context) => WithDrawCubit(HomeRepoImpl())),
      ],
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetPaymentSucc) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Add_wIthdraw,
                          style:
                              StylesData.font20.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocProvider(
                          create: (context) => WithDrawCubit(HomeRepoImpl())
                            ..getWithDrawBalance(),
                          child: BlocConsumer<WithDrawCubit, WithDrawState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is GetBalanceSucc) {
                                return Text(
                                  '${S.of(context).YourBalance}: ${state.balance}',
                                  style: StylesData.font16.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                );
                              } else if (state is GetBalanceError) {
                                return Container();
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFormedFiled(
                          controller: amountController,
                          hintText: S.of(context).amount,
                          type: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButton<String>(
                                    underline: const SizedBox(),
                                    value: value,
                                    alignment: AlignmentDirectional.centerStart,
                                    isExpanded: true,
                                    hint: Text(
                                      S.of(context).Choose_The_Payment_Method,
                                      style: StylesData.font14.copyWith(
                                          color: const Color(0x330D223F)),
                                    ),
                                    onChanged: (String? selecteddata) {
                                      setState(() {
                                        value = selecteddata;
                                        for (var element
                                            in BookingCubit.get(context)
                                                .model!
                                                .data!) {
                                          if (element.id.toString() ==
                                              selecteddata) {
                                            print(selecteddata);
                                            print(element.nameAr);

                                            setState(() {
                                              BookingCubit.get(context)
                                                  .account = element.account;
                                            });
                                            break;
                                          }
                                        }
                                      });
                                      setState(() {});
                                    },
                                    items: BookingCubit.get(context)
                                        .model
                                        ?.data
                                        ?.map((item) {
                                      return DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              '$xURLIMAGE${item.image}' ?? '',
                                              width: 30,
                                              height: 30,
                                            ),
                                            const SizedBox(width: 10),
                                            Text((LocalizationCubit.get(context)
                                                        .isArabic()
                                                    ? item.nameAr
                                                    : item.name) ??
                                                ''),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFormedFiled(
                          controller: accountNumberController,
                          hintText: S.of(context).AccountNumber,
                          type: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<WithDrawCubit, WithDrawState>(
                          listener: (context, state) {
                            if (state is AddWithDrawSucc) {
                              showToast(msq: state.msg.toString());
                              NavegatorPush(
                                  context,
                                  const HomeView(
                                    currentidex: 0,
                                  ));
                            }
                            if (state is AddWithDrawError) {
                              showToast(msq: state.msg.toString());
                            }
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return defaultButton(
                                fun: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (value != null) {
                                      print('value is $value');
                                      BlocProvider.of<WithDrawCubit>(context)
                                          .addWithDraw(
                                              amount: amountController.text,
                                              password: passwordController.text,
                                              account_number:
                                                  accountNumberController.text,
                                              payment_method_id: value ?? '1');
                                    } else {
                                      showToast(
                                          msq: S
                                              .of(context)
                                              .Please_select_payment_method_and_upload_payment_screen);
                                    }
                                  }
                                },
                                textWidget: state is AddWithDrawLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        S.of(context).Add_wIthdraw,
                                        style: StylesData.font13,
                                      ),
                                height: 54,
                                c: ConstColor.kMainColor);
                          },
                        ),
                      ],
                    )),
              ),
            );
          } else if (state is GetPaymentError) {
            return const FailureWidget();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
