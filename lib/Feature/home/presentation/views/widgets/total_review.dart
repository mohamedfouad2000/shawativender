import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shawativender/Core/utils/styles.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class TotalReview extends StatelessWidget {
  const TotalReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientText(
          '4.40',
          style: StylesData.font28,
          colors: const [
            Color(0xff595CF8),
            Color(0xff3687F5),
          ],
        ),
        Text(
          "Total Reviews (10)",
          style: StylesData.font11.copyWith(color: Colors.black),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Color(0xFFF4B85D),
            ),
            Icon(
              Icons.star,
              color: Color(0xFFF4B85D),
            ),
            Icon(
              Icons.star,
              color: Color(0xFFF4B85D),
            ),
            Icon(
              Icons.star,
              color: Color(0xFFF4B85D),
            ),
            Icon(
              Icons.star,
              color: Color(0xFFF4B85D),
            ),
          ],
        ),
      ],
    );
  }
}
