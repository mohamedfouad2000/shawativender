import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawativender/Core/widgets/custom_loading_widget.dart';
import 'package:shawativender/Core/widgets/empty_wid.dart';
import 'package:shawativender/Core/widgets/faliure_wid.dart';
import 'package:shawativender/Core/widgets/loading/home_lead_loading.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/show%20Reviews/show_reviews_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/review_card.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/total_review.dart';

class ReviewCardList extends StatelessWidget {
  const ReviewCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowReviewsCubit, ShowReviewsState>(
        listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      if (state is ShowReviewsSucc) {
        return Column(
          children: [
            const TotalReview(),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ReviewCard(
                    rate: double.parse(state.model.data!.reviews![index].rating
                            .toString()) ??
                        0,
                    username:
                        state.model.data?.reviews?[index].user?.name ?? '',
                    image: state.model.data?.reviews?[index].user?.image ?? '',
                    serverName:
                        state.model.data?.reviews?[index].service?.name ?? '',
                    serverNameArabic:
                        state.model.data?.reviews?[index].service?.nameAr ?? '',
                    msq: state.model.data?.reviews?[index].review ?? ''),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.model.data?.reviews?.length ?? 0),
            if (state.model.data == null) const EmptyWidget()
          ],
        );
      } else if (state is ShowReviewsError) {
        return const Center(child: FailureWidget());
      } else {
        return const CustomLoadingWidget(child: HomeLeadLoading());
      }
    });
  }
}
