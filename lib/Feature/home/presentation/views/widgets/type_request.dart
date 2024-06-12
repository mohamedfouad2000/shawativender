import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Provider%20Serves/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/get%20requests%20serves/get_request_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/date_category_screen.dart';
import 'package:shawativender/generated/l10n.dart';

class TypeRequest extends StatefulWidget {
  const TypeRequest({
    super.key,
  });

  @override
  State<TypeRequest> createState() => _TypeRequestState();
}

class _TypeRequestState extends State<TypeRequest> {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> categoriesList = [
      S.of(context).pending,
      // S.of(context).inprogress,
      S.of(context).Approved,
      S.of(context).Reject,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return typeItem(
                  name: categoriesList[index],
                  namear: categoriesList[index],
                  index: index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: categoriesList.length,
          ),
        ),
      ],
    );
  }

  Widget typeItem(
      {required String name, required String namear, required int index}) {
    return BlocConsumer<GetRequestServesCubit, GetRequestServesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              BlocProvider.of<GetRequestServesCubit>(context).getRequests(
                  id: -1, status: (index != 0 ? index + 2 : index + 1));
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
                color: currentIndex == index
                    ? ConstColor.kMainColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade300)),
            child: Center(
              child: Text(
                LocalizationCubit.get(context).isArabic() ? namear : name,
                style: StylesData.font17.copyWith(
                    fontSize: 15,
                    color: currentIndex == index ? Colors.white : Colors.black),
              )
                  .animate()
                  .addEffect(const AlignEffect(curve: Curves.bounceIn))
                  .scale(curve: Curves.easeInOutQuad),
            ),
          ),
        );
      },
    );
  }
}
