import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shawativender/Core/utils/styles.dart';
import 'package:shawativender/Core/widgets/spacer.dart';
import 'package:shawativender/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_person.dart';
import 'package:shawativender/Feature/home/presentation/views/widgets/booking_state_widget.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.rate,
    required this.username,
    required this.image,
    required this.serverName,
    required this.serverNameArabic,
    required this.msq,
  });
  final double rate;
  final String username;
  final String image;
  final String serverName;
  final String serverNameArabic;
  final String msq;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade300),
      ),
      duration: const Duration(seconds: 2),
      curve: Easing.legacy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const BookingStatusWidget(),
          const SizedBox(
            height: 10,
          ),
          const SpacerWidget(),
          const SizedBox(
            height: 10,
          ),
          BookingPerson(rate: rate, username: username, image: image, msq: msq),
          const SizedBox(
            height: 10,
          ),
          Text(
            LocalizationCubit.get(context).isArabic()
                ? serverNameArabic
                : serverName,
            style: StylesData.font11.copyWith(color: Colors.black),
          ).animate().scale(curve: Curves.easeInOutQuad),
        ],
      ),
    );
  }
}
