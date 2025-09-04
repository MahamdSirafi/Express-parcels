import 'package:flutter/material.dart';
import 'package:spl/core/utils/styles/style_to_colors.dart';
import 'package:spl/features/my_ratings/presentation/views/widgets/custom_contain_text_card_in_my_rating_card.dart';

class CustomTextCardInMyRatingCard extends StatelessWidget {
  const CustomTextCardInMyRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(height * 0.014),
      decoration: BoxDecoration(
        border: Border.all(color: StyleToColors.mediumSkyBlueColor),
        borderRadius: BorderRadius.circular(height * 0.021),
      ),
      child: const CustomContainTextCardInMyRatingCard(),
    );
  }
}
