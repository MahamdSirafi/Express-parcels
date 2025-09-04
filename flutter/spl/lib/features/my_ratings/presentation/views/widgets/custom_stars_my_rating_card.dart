import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';

class CustomStarsMyRatingCard extends StatelessWidget {
  const CustomStarsMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return const Icon(Icons.star, color: StyleToColors.neonYellowColor);
      }),
    );
  }
}
