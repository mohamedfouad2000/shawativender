import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/review_card.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/total_review.dart';

class ReviewScreenBody extends StatelessWidget {
  const ReviewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16, top: 32, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomHomeAppBar(),
            SizedBox(
              height: 20,
            ),
            TotalReview(),
            SizedBox(
              height: 20,
            ),
            ReviewCard(),
            SizedBox(
              height: 20,
            ),
            ReviewCard(),
            SizedBox(
              height: 20,
            ),
            ReviewCard(),
          ],
        ),
      ),
    );
  }
}
