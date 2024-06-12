import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/loading/home_lead_loading.dart';
import 'package:shawativender/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/show%20Reviews/show_reviews_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/review_card.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/review_card_list.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/total_review.dart';

class ReviewScreenBody extends StatelessWidget {
  const ReviewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowReviewsCubit(HomeRepoImpl())..getReviews(),
      child: BlocConsumer<ShowReviewsCubit, ShowReviewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomHomeAppBar(),
                  SizedBox(
                    height: 20,
                  ),
                  ReviewCardList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
