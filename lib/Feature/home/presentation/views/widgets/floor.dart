import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawativender/generated/l10n.dart';

class FloorFIltter extends StatefulWidget {
  const FloorFIltter({
    super.key,
  });

  @override
  State<FloorFIltter> createState() => _FloorFIltterState();
}

class _FloorFIltterState extends State<FloorFIltter> {
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).floor,
              style: StylesData.font16,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return typeItem(index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 7,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget typeItem({required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          print(index);

          SearchCubit.get(context).floor = index;
          print(SearchCubit.get(context).floor);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: SearchCubit.get(context).floor == index
                ? ConstColor.kMainColor
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Text(
            '${index + 1}',
            style: StylesData.font17.copyWith(
                fontSize: 15,
                color: SearchCubit.get(context).floor == index
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
