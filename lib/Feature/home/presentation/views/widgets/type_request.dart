import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/components.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/cubit/get_provider_serves_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/screens/date_category_screen.dart';

class TypeRequest extends StatefulWidget {
  const TypeRequest({
    super.key,
  });

  @override
  State<TypeRequest> createState() => _TypeRequestState();
}

class _TypeRequestState extends State<TypeRequest> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeSucc) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return typeItem(
                        name: state.model.data?.categories?[index].brandName ??
                            '',
                        namear:
                            state.model.data?.categories?[index].brandNameAr ??
                                '',
                        index: state.model.data?.categories?[index].id ?? 0);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: state.model.data?.categories?.length ?? 0,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget typeItem(
      {required String name, required String namear, required int index}) {
    return BlocConsumer<GetProviderServesCubit, GetProviderServesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              BlocProvider.of<GetProviderServesCubit>(context)
                  .getProviderServes(catId: index);
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
              ),
            ),
          ),
        );
      },
    );
  }
}
