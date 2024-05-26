import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/assets_data.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/home_view.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Support%20Cubit/support_cubit.dart';
import 'package:shawativender/generated/l10n.dart';

class SupportScreenBody extends StatefulWidget {
  const SupportScreenBody({super.key});

  @override
  State<SupportScreenBody> createState() => _SupportScreenBodyState();
}

class _SupportScreenBodyState extends State<SupportScreenBody> {
  TextEditingController callusController = TextEditingController();
  TextEditingController emailusController = TextEditingController();
  TextEditingController note1controller = TextEditingController();
  TextEditingController note2controller = TextEditingController();

  int maxline1 = 1;
  int maxline2 = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(HomeRepoImpl()),
      child: BlocConsumer<SupportCubit, SupportState>(
        listener: (context, state) {
          if (state is SupportSucc) {
            showToast(msq: state.msq);
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is SupportError) {
            showToast(msq: state.msg);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    S.of(context).support,
                    style: StylesData.font24Google,
                  )),
                  const SizedBox(
                    height: 4,
                  ),
                  Center(
                      child: Text(
                    S.of(context).supportSubTitle,
                    style: StylesData.font12,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextFormedFiled(
                      controller: callusController,
                      type: TextInputType.number,
                      hintText: S.of(context).callus,
                      sufficon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(AssetsData.calling),
                          height: 12,
                          width: 12,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFormedFiled(
                      type: TextInputType.emailAddress,
                      controller: emailusController,
                      hintText: S.of(context).emailus,
                      sufficon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(
                            AssetsData.sms,
                          ),
                          height: 12,
                          width: 12,
                        ),
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    S.of(context).writeus,
                    style: StylesData.font18,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    S.of(context).enteryourmessage,
                    style: StylesData.font12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextFormedFiled(
                    controller: note1controller,
                    hintText: 'select subject',
                    maxLines: maxline1,
                    sufficon: InkWell(
                      onTap: () {
                        setState(() {
                          maxline1 = maxline1 == 6 ? 1 : maxline1 = 6;
                        });
                      },
                      child: maxline1 == 1
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xff27A6FF)))
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_up_outlined,
                                  color: Color(0xff27A6FF))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextFormedFiled(
                    hintText: S.of(context).writeus,
                    controller: note2controller,
                    maxLines: maxline2,
                    sufficon: InkWell(
                      onTap: () {
                        setState(() {
                          maxline2 = maxline2 == 6 ? 1 : maxline2 = 6;
                        });
                      },
                      child: maxline2 == 1
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xff27A6FF)))
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_up_outlined,
                                  color: Color(0xff27A6FF))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      fun: () {
                        BlocProvider.of<SupportCubit>(context).addSupport(
                            subject:
                                '${callusController.text} ${emailusController.text}',
                            message:
                                '${note1controller.text} ${note2controller.text}');
                        // NavegatorPush(context, const LangPageView());
                      },
                      textWidget: state is SupportLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              S.of(context).submit,
                              style: StylesData.font13,
                            ),
                      height: 54,
                      c: ConstColor.kMainColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
