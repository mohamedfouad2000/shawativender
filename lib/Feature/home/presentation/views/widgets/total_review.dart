import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/utils/colors.dart';

import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/show%20Reviews/show_reviews_cubit.dart';
import 'package:shawativender/generated/l10n.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class TotalReview extends StatelessWidget {
  const TotalReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowReviewsCubit, ShowReviewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ShowReviewsSucc) {
          return Column(
            children: [
              GradientText(
                state.model.data!.rating.toString().length < 3
                    ? state.model.data!.rating.toString().substring(0, 1)
                    : (state.model.data!.rating.toString().substring(0, 1)),
                style: StylesData.font28,
                colors: [
                  ConstColor.kMainColor,
                  ConstColor.kMainColor,

                  // ConstColor.kMainColor,
                ],
              ),
              Text(
                "${S.of(context).TotalReview} (${state.model.data?.reviews?.length ?? 0})",
                style: StylesData.font11.copyWith(color: Colors.black),
              ).animate().scale(curve: Curves.easeInOutQuad),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF4B85D),
                  ).animate().scale(curve: Curves.easeInOutQuad),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF4B85D),
                  ).animate().scale(curve: Curves.easeInOutQuad),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF4B85D),
                  ).animate().scale(curve: Curves.easeInOutQuad),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF4B85D),
                  ).animate().scale(curve: Curves.easeInOutQuad),
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF4B85D),
                  ).animate().scale(curve: Curves.easeInOutQuad),
                ],
              ),
            ],
          );
        } else if (state is ShowReviewsError) {
          return Center(child: Text(state.msg));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
